//
//  PageInteractor.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 30.04.2021..
//  
//

import Foundation

protocol PageBusinessLogic {

    func getUsers(numberOfUser: Int)
//    var users: [User]? { get }

}

class PageInteractor {

    var presenter: PagePresentationLogic?
    let pageWorker = PageWorker()

}

// MARK: - Business Logic

extension PageInteractor: PageBusinessLogic {

    func getUsers(numberOfUser: Int) {
        pageWorker.getUsers(numberOfUsers: numberOfUser) { result in
            switch result {
            case .failure(let error): print(error)
            case .success(let users):
                self.presenter?.presentUsers(users)
            }
        }
    }

}
