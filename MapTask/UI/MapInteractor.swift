//
//  MapInteractor.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 30.04.2021..
//  
//

import Foundation
import CoreLocation

protocol MapBusinessLogic {

    func getPointAnnotations()

}

protocol MapDataStore {

    var users: [User]? { get set }

}

class MapInteractor: MapDataStore {

    var presenter: MapPresentationLogic?
    var users: [User]? {
        didSet {
            getPointAnnotations()
        }
    }

}

// MARK: - Business Logic

extension MapInteractor: MapBusinessLogic {

    func getPointAnnotations() {
        guard let users = users else { return }

        var coordinates: [CLLocationCoordinate2D] = []
        for user in users {
            let latitude = CLLocationDegrees(user.location?.coordinates?.latitude ?? "0")
            let longitude = CLLocationDegrees(user.location?.coordinates?.longitude ?? "0")
            let coordinate = CLLocationCoordinate2D(latitude: latitude ?? 0, longitude: longitude ?? 0)
            coordinates.append(coordinate)
        }

        presenter?.presentPointAnnotations(withCoordinates: coordinates)
    }

}
