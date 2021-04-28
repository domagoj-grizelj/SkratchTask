//
//  UserResponse.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 28.04.2021..
//

import Foundation

struct UserResponse: Codable {

    let results: [User]?
    let info: Info?

    struct Info: Codable {

        let seed: String
        let results: Int
        let page: Int
        let version: String
        
    }
    
}
