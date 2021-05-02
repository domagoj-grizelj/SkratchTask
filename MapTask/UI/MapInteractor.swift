//
//  MapInteractor.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 30.04.2021..
//  
//

import Foundation
import CoreLocation
import Mapbox

protocol MapBusinessLogic {

    func clearPointAnnotations()
    func getPointAnnotations(forUsers users: [User])

}

protocol MapDataStore {

    var users: [User]? { get set }

}

class MapInteractor: MapDataStore {

    var presenter: MapPresentationLogic?
    var users: [User]? {
        didSet {
            clearPointAnnotations()
//            getPointAnnotations()
        }
    }

}

// MARK: - Business Logic

extension MapInteractor: MapBusinessLogic {

    func getPointAnnotations(forUsers users: [User]) {
        var coordinates: [CLLocationCoordinate2D] = []
        for user in users {
            let latitude = CLLocationDegrees(user.location?.coordinates?.latitude ?? "0")
            let longitude = CLLocationDegrees(user.location?.coordinates?.longitude ?? "0")
            let coordinate = CLLocationCoordinate2D(latitude: latitude ?? 0, longitude: longitude ?? 0)
            coordinates.append(coordinate)
        }

        presenter?.presentPointAnnotations(withCoordinates: coordinates)
    }

    func clearPointAnnotations() {
        presenter?.clearPointAnnotations()
    }

}


