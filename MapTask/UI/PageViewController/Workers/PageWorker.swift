//
//  PageWorker.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 01.05.2021..
//

import Foundation
import Moya

class PageWorker {

    let usersProvider = UsersProvider()

    func getUsers(numberOfUsers: Int, completion: @escaping ((Result<[User], MoyaError>) -> Void)) {
        usersProvider.fetchUsers(numberOfUsers: numberOfUsers) { result in
            switch result {
            case .failure(let error): completion(.failure(error))
            case .success(let usersResponse): completion(.success(usersResponse.results))
            }
        }
    }

}
