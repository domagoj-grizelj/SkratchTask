//
//  BaseTarget.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 28.04.2021..
//

import Moya

protocol BaseTarget: TargetType {

}

extension BaseTarget {
    var baseURL: URL {
        return getBaseUrl()
    }

    var sampleData: Data {
        return Data()
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }

    var validationType: ValidationType {
        return .successCodes
    }
}

// MARK: - Private Methods

private extension BaseTarget {

    private func getBaseUrl() -> URL {
        guard let baseUrlData = Bundle.main.object(forInfoDictionaryKey: "Base URL") else {
            fatalError("Base URL must be configured in Info.plist file")
        }

        guard let baseUrlString = baseUrlData as? String else {
            fatalError("Invalid Base URL")
        }

        guard let baseUrl = URL(string: baseUrlString) else {
            fatalError("Invalid Base URL")
        }

        return baseUrl
    }

}
