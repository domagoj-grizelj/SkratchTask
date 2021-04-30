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

protocol MapRouterDelegate: AnyObject {
    
}

class MapRouter {
    
    weak var viewController: MapViewController?
    weak var delegate: MapRouterDelegate?
    
}

// MARK: - Routing Logic
extension MapRouter: MapRoutingLogic {
    
}
