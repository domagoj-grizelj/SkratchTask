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
    func handleAnnotations(forMapView mapView: MGLMapView, users: [User]?)

}

class MapInteractor {

    var presenter: MapPresentationLogic?

}

// MARK: - Business Logic

extension MapInteractor: MapBusinessLogic {

    func clearPointAnnotations() {
        presenter?.clearPointAnnotations()
    }

    func handleAnnotations(forMapView mapView: MGLMapView, users: [User]?) {
        let swLimit = mapView.visibleCoordinateBounds.sw
        let neLimit = mapView.visibleCoordinateBounds.ne
        let visibleUsers = getObjectsInVisibleRect(swLimit: swLimit, neLimit: neLimit, users: users)

        var newAnnotations: [MGLPointAnnotation] = []
        for user in visibleUsers {
            let latitude = CLLocationDegrees(user.location?.coordinates?.latitude ?? "0") ?? 0
            let longitude = CLLocationDegrees(user.location?.coordinates?.longitude ?? "0") ?? 0
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

            let pointAnnotation = MGLPointAnnotation()
            pointAnnotation.title = "asdf"
            pointAnnotation.coordinate = coordinate
            newAnnotations.append(pointAnnotation)
        }

        var annotationsToRemove: [MGLAnnotation] = []
        if let existingPointAnnotations = mapView.annotations {
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

    private func getObjectsInVisibleRect(swLimit: CLLocationCoordinate2D, neLimit: CLLocationCoordinate2D, users: [User]?) -> [User] {
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


