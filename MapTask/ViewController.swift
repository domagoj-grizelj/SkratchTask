//
//  ViewController.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 28.04.2021..
//

import UIKit
import Mapbox

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: "mapbox://styles/mapbox/streets-v11")
        let mapView = MGLMapView(frame: view.bounds, styleURL: url)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(CLLocationCoordinate2D(latitude: 59.31, longitude: 18.06), zoomLevel: 9, animated: false)
        view.addSubview(mapView)

        UsersService().fetchUsers(numberOfUsers: 1) { result in
            switch result {
            case .failure(let error): print(error)
            case .success(let users): print(users)
            }
        }

    }


}

