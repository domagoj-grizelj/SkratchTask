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

    func fetchUsers(numberOfUsers: Int, success: @escaping (([User]) -> Void), failure: @escaping (MoyaError) -> Void) {
        provider.request(.getUsers(numberOfUsers: numberOfUsers)) { result in
            switch result {
            case .success(let response): print("ASDF")
            case .failure(let error): print("ASDASDASD")
            }
        }
    }

}
