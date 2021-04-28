//
//  UsersService.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 28.04.2021..
//

import Foundation
import Moya

class UsersService {

    private let provider: MoyaProvider<UsersTarget>

    init(provider: MoyaProvider<UsersTarget> = MoyaProvider<UsersTarget>()) {
      self.provider = provider
    }

    func fetchUsers(numberOfUsers: Int, completion: @escaping ((Result<UserResponse, MoyaError>) -> Void)) {
        provider.httpRequest(.getUsers(numberOfUsers: numberOfUsers), completion: completion)
    }

}
