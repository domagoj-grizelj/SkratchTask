//
//  PageRouter.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 30.04.2021..
//  
//

import Foundation
import UIKit
import FittedSheets

protocol PageRoutingLogic {

    func presentUserDetailsSheet()
    func presentContainerViewControllers()
    func switchToMapViewController()
    func switchToFriendsViewController()

}

protocol PageDataPassing {

    var dataStore: PageDataStore? { get }
    func passDataToFriends()
    func passDataToMap(users: [User]?)

}

protocol PageRouterDelegate: AnyObject {

}

class PageRouter: PageDataPassing {

    weak var viewController: PageViewController?
    weak var delegate: PageRouterDelegate?
    var dataStore: PageDataStore?

    private var mapViewController: MapViewController?
    private var friendsNavigationViewController: UINavigationController?

    func passDataToFriends() {
        let friendsViewController = friendsNavigationViewController?.children.first as? FriendsViewController
        friendsViewController?.interactor?.users = dataStore?.users
    }

    func passDataToMap(users: [User]?) {
        mapViewController?.users = users
        mapViewController?.interactor?.users = users
    }

}

// MARK: - Routing Logic

extension PageRouter: PageRoutingLogic {

    func presentUserDetailsSheet() {
        // TODO: - Implement
    }

    func presentContainerViewControllers() {
        mapViewController = MapViewController(delegate: self)
        friendsNavigationViewController = UINavigationController(rootViewController: FriendsViewController(delegate: self))
    }

    func switchToMapViewController() {
        guard let mapViewController = mapViewController else { return }
        viewController?.setViewControllers([mapViewController], direction: .reverse, animated: true, completion: nil)

    }

    func switchToFriendsViewController() {
        guard let friendsNavigationViewController = friendsNavigationViewController else { return }
        viewController?.setViewControllers([friendsNavigationViewController], direction: .forward, animated: true, completion: nil)
//        guard let friends = friendsNavigationViewController else { return }
//        let options = SheetOptions(shrinkPresentingViewController: false)
//        let sheetViewController = SheetViewController(controller: friends, sizes: [.percent(0.7)], options: options)
//        sheetViewController.cornerRadius = 30
//        sheetViewController.minimumSpaceAbovePullBar = 8
//        sheetViewController.gripSize = CGSize(width: 56, height: 5)
//        sheetViewController.gripColor = .paleBlue
//
//        viewController?.present(sheetViewController, animated: true, completion: nil)
    }

}

// MARK: - MapRouterDelegate

extension PageRouter: MapRouterDelegate {

}

// MARK: - FriendsRouterDelegate

extension PageRouter: FriendsRouterDelegate {

    func navigateToFriendDetails(user: User) {
        let friendDetailsViewController = FriendDetailsViewController(delegate: self, user: user)

        let options = SheetOptions(shrinkPresentingViewController: false)
        let sheetViewController = SheetViewController(controller: friendDetailsViewController, sizes: [.percent(0.7)], options: options)
        sheetViewController.cornerRadius = 30
        sheetViewController.minimumSpaceAbovePullBar = 8
        sheetViewController.gripSize = CGSize(width: 56, height: 5)
        sheetViewController.gripColor = .paleBlue

        viewController?.present(sheetViewController, animated: true, completion: nil)
    }

}

// MARK: - FriendDetailsRouterDelegate

extension PageRouter: FriendDetailsRouterDelegate {

}
