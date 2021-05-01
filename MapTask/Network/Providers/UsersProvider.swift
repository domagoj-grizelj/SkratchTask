//
//  UsersProvider.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 28.04.2021..
//

import Foundation
import Moya

struct UsersProvider {

    // MARK: - Dependencies

    private let provider: MoyaProvider<UsersTarget>

    // MARK: - Lifecycle

    init(provider: MoyaProvider<UsersTarget> = MoyaProvider<UsersTarget>()) {
      self.provider = provider
    }

}

// MARK: - Users

extension UsersProvider {

    func fetchUsers(numberOfUsers: Int, completion: @escaping ((Result<UserResponse, MoyaError>) -> Void)) {
        provider.httpRequest(.getUsers(numberOfUsers: numberOfUsers), completion: completion)
    }

}
