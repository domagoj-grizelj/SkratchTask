//
//  User.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 28.04.2021..
//

import Foundation

struct User: Codable {

    let gender: String
    let name: UserNameData
    let location: UserLocationData
    let email: String
    let login: UserLoginData
    let registered: UserRegistrationData
    let dob: UserRegistrationData
    let phone: String
    let picture: UserPictureData

    struct UserNameData: Codable {

        let title: String
        let first: String
        let last: String

    }

    struct UserLocationData: Codable {

        let street: String
        let city: String
        let state: String
        let postcode: String
        let coortinates: UserLocationCoordinates

        struct UserLocationCoordinates: Codable {

            let latitude: String
            let longitude: String

        }

    }

    struct UserLoginData: Codable {

        let userName: String

    }

    struct UserRegistrationData: Codable {

        let date: String
        let age: Int

    }

    struct UserPictureData: Codable {

        let large: String
        let medium: String
        let thumbnail: String

    }
}
