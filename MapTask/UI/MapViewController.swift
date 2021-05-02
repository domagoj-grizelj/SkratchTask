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

    var interactor: MapBusinessLogic?
    var router: MapRoutingLogic?
    private lazy var contentView = MapContentView()
    var users: [User]? {
        didSet {
            interactor?.handleAnnotations(forMapView: contentView.mapView, users: users)
        }
    }

    init(delegate: MapRouterDelegate?) {
        super.init(nibName: nil, bundle: nil)
        let interactor = MapInteractor()
        let presenter = MapPresenter()
        let router = MapRouter()
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

        let annotationView = MapUserView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        annotationView.set(user)
        annotationView.didTapOnAvatarButton = { [weak self] user in
            self?.router?.navigateToFriendDetails(user: user)
        }
        annotationView.snp.makeConstraints {
            $0.size.equalTo(100)
        }

        return annotationView
    }

    func mapView(_ mapView: MGLMapView, regionDidChangeAnimated animated: Bool) {
        interactor?.handleAnnotations(forMapView: mapView, users: users)
    }

}
