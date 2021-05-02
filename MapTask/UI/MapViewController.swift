//
//  MapViewController.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 30.04.2021..
//  
//

import UIKit
import Mapbox

protocol MapDisplayLogic: AnyObject {

    func displayPointAnnotations(_ pointAnnotations: [MGLPointAnnotation])
    func clearPointAnnotations()

}

class MapViewController: UIViewController {

    var interactor: (MapBusinessLogic & MapDataStore)?
    var router: MapRoutingLogic?
    private lazy var contentView = MapContentView()
    var users: [User]?

    init(delegate: MapRouterDelegate?) {
        super.init(nibName: nil, bundle: nil)
        let interactor = MapInteractor()
        let presenter = MapPresenter()
        let router = MapRouter()
        router.dataStore = interactor
        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        router.delegate = delegate
        self.interactor = interactor
        self.router = router
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

}

// MARK: - Display Logic

extension MapViewController: MapDisplayLogic {

    func displayPointAnnotations(_ pointAnnotations: [MGLPointAnnotation]) {
        contentView.mapView.addAnnotations(pointAnnotations)
    }

    func clearPointAnnotations() {
        if let annotations = contentView.mapView.annotations {
            contentView.mapView.removeAnnotations(annotations)
        }
    }

}

// MARK: - Private Methods

private extension MapViewController {

    func setupViews() {
        setupContentView()
    }

    func setupContentView() {
        contentView.mapView.delegate = self
    }

}

// MARK: - MGLMapViewDelegate

extension MapViewController: MGLMapViewDelegate {

    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        guard annotation is MGLPointAnnotation else {
            return nil
        }

        guard let user = users?.first(where: {$0.location?.coordinates?.longitude == String(annotation.coordinate.longitude) }) else {
            return MGLAnnotationView()
        }

        let annotationView = MapUserView(frame: CGRect.zero)
        annotationView.set(user)

        return annotationView
    }

    func mapView(_ mapView: MGLMapView, regionDidChangeAnimated animated: Bool) {
        let swLimit = mapView.visibleCoordinateBounds.sw
        let neLimit = mapView.visibleCoordinateBounds.ne
        let visibleUsers = getObjectsInVisibleRect(swLimit: swLimit, neLimit: neLimit)

        var newAnnotations: [MGLPointAnnotation] = []
        for user in visibleUsers {
            let latitude = CLLocationDegrees(user.location?.coordinates?.latitude ?? "0") ?? 0
            let longitude = CLLocationDegrees(user.location?.coordinates?.longitude ?? "0") ?? 0
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

            let pointAnnotation = MGLPointAnnotation()
            pointAnnotation.coordinate = coordinate
            newAnnotations.append(pointAnnotation)
        }

        var annotationsToRemove: [MGLAnnotation] = []
        if let existingPointAnnotations = contentView.mapView.annotations {
            for annotation in existingPointAnnotations {
                if newAnnotations.contains(where: { $0.coordinate.latitude == annotation.coordinate.latitude && $0.coordinate.longitude == annotation.coordinate.longitude }) {
                    newAnnotations.removeAll(where: { $0.coordinate.latitude == annotation.coordinate.latitude && $0.coordinate.longitude == annotation.coordinate.longitude })
                } else {
                    annotationsToRemove.append(annotation)
                }
            }
        }

        mapView.removeAnnotations(annotationsToRemove)
        mapView.addAnnotations(newAnnotations)
    }

    private func getObjectsInVisibleRect(swLimit: CLLocationCoordinate2D, neLimit: CLLocationCoordinate2D) -> [User] {
        guard let users = users else { return [] }

        var limitedUsers: [User] = []
        for user in users {
            let latitude = CLLocationDegrees(user.location?.coordinates?.latitude ?? "0") ?? 0
            let longitude = CLLocationDegrees(user.location?.coordinates?.longitude ?? "0") ?? 0

            if latitude > swLimit.latitude && latitude < neLimit.latitude &&
                longitude > swLimit.longitude && longitude < neLimit.longitude {
                limitedUsers.append(user)
            }

            if limitedUsers.count == 20 {
                break
            }
        }

        return limitedUsers
    }

}
