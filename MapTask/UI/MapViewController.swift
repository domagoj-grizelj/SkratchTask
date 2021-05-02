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

}

class MapViewController: UIViewController {

    var interactor: (MapBusinessLogic & MapDataStore)?
    var router: MapRoutingLogic?
    private lazy var contentView = MapContentView()
    private var users: [User]?

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

        // Use the point annotation’s longitude value (as a string) as the reuse identifier for its view.
        let reuseIdentifier = "\(annotation.coordinate.longitude)"

        // For better performance, always try to reuse existing annotations.
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier) as? MapUserView

        // If there’s no reusable annotation view available, initialize a new one.
        if annotationView == nil {
            guard let users = interactor?.users,
                  let user = users.first(where: {$0.location?.coordinates?.longitude == String(annotation.coordinate.longitude) }) else {
                return nil
            }

            annotationView = MapUserView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            annotationView?.set(user)
        }

        return annotationView
    }

}
