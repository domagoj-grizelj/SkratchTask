//
//  UsersTarget.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 28.04.2021..
//

import Foundation
import Moya

enum UsersTarget {

    case getUsers(numberOfUsers: Int)

}

extension UsersTarget: BaseTarget {

    var path: String {
        switch self {
        case .getUsers: return ""
        }
    }

    var method: Moya.Method {
        switch self {
        case .getUsers: return Moya.Method.get
        }
    }

    var task: Task {
        switch self {
        case .getUsers(let numberOfUsers): return .requestParameters(parameters: ["results" : numberOfUsers], encoding: URLEncoding.queryString)
        }
    }
}

