//
//  PagePresenter.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 30.04.2021..
//  
//

import Foundation

protocol PagePresentationLogic {

    func presentUsers(_ users: [User])
  
}

class PagePresenter {

  weak var viewController: PageDisplayLogic?

}

// MARK: - Presentation Logic

extension PagePresenter: PagePresentationLogic {

    func presentUsers(_ users: [User]) {
        viewController?.displayUsers(users)
    }

}
