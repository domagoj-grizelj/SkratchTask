//
//  FriendsInteractor.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 30.04.2021..
//  
//

import Foundation

protocol FriendsBusinessLogic {

}

protocol FriendsDataStore {

    var users: [User]? { get set }

}

class FriendsInteractor: FriendsDataStore {

    var presenter: FriendsPresentationLogic?

    var users: [User]? {
        didSet {
            guard let users = users else { return }
            presenter?.presentUsers(users)
        }
    }

}

// MARK: - Business Logic

extension FriendsInteractor: FriendsBusinessLogic {

}
