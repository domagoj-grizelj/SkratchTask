//
//  MapPresenter.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 30.04.2021..
//  
//

import Foundation
import CoreLocation
import Mapbox

protocol MapPresentationLogic {

    func presentPointAnnotations(withCoordinates coordinates: [CLLocationCoordinate2D])
    func clearPointAnnotations()

}

class MapPresenter {

    weak var viewController: MapDisplayLogic?
    
}

// MARK: - Presentation Logic

extension MapPresenter: MapPresentationLogic {

    func presentPointAnnotations(withCoordinates coordinates: [CLLocationCoordinate2D]) {
        var pointAnnotations = [MGLPointAnnotation]()

        for coordinate in coordinates {
            let point = MGLPointAnnotation()
            point.coordinate = coordinate
            point.title = "\(coordinate.latitude), \(coordinate.longitude)"
            pointAnnotations.append(point)
        }

        viewController?.displayPointAnnotations(pointAnnotations)
    }

    func clearPointAnnotations() {
        viewController?.clearPointAnnotations()
    }

}
