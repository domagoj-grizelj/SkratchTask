//
//  MapRouter.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 30.04.2021..
//  
//

import Foundation

protocol MapRoutingLogic {
    
}

protocol MapDataPassing {

    var dataStore: MapDataStore? { get }
}

protocol MapRouterDelegate: AnyObject {
    
}

class MapRouter: MapDataPassing {
    
    weak var viewController: MapViewController?
    weak var delegate: MapRouterDelegate?

    var dataStore: MapDataStore?
    
}

// MARK: - Routing Logic
extension MapRouter: MapRoutingLogic {
    
}
