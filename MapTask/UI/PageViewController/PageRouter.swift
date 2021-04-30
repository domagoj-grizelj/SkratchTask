//
//  PageRouter.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 30.04.2021..
//  
//

import Foundation

protocol PageRoutingLogic {

    func presentUserDetailsSheet()
  
}

protocol PageRouterDelegate: AnyObject {
  
}

class PageRouter {

  weak var viewController: PageViewController?
  weak var delegate: PageRouterDelegate?

}

// MARK: - Routing Logic

extension PageRouter: PageRoutingLogic {

    func presentUserDetailsSheet() {
        // TODO: - Implement
    }

}

extension PageRouter: MapRouterDelegate {

}

extension PageRouter: FriendsRouterDelegate {

}
