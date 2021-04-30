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

}

class MapViewController: UIViewController {

    var interactor: MapBusinessLogic?
    var router: MapRoutingLogic?
    private lazy var contentView = MapContentView()

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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: "mapbox://styles/mapbox/streets-v11")
        let mapView = MGLMapView(frame: view.bounds, styleURL: url)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(CLLocationCoordinate2D(latitude: 59.31, longitude: 18.06), zoomLevel: 9, animated: false)
        view.addSubview(mapView)
    }

}

// MARK: - Display Logic

extension MapViewController: MapDisplayLogic {

}

// MARK: - Private Methods

private extension MapViewController {

    func setupViews() {
        // setup title, background, navigation buttons, etc
        setupContentView()
    }

    func setupContentView() {
        view.addSubview(contentView)
        // add constraints
    }

}
