//
//  FriendsPresenter.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 30.04.2021..
//  
//

import Foundation

protocol FriendsPresentationLogic {

    func presentUsers(_ users: [User])

}

class FriendsPresenter {

    weak var viewController: FriendsDisplayLogic?

}

// MARK: - Presentation Logic

extension FriendsPresenter: FriendsPresentationLogic {

    func presentUsers(_ users: [User]) {
        viewController?.displayUsers()
    }
    
}
