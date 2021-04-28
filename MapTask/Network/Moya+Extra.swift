//
//  Moya+Extra.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 28.04.2021..
//

import Foundation
import Moya

// MARK: - Plugin extension

extension MoyaProvider {

    public convenience init() {
        self.init(endpointClosure: MoyaProvider.defaultEndpointMapping,
                  requestClosure: MoyaProvider.defaultRequestMapping,
                  stubClosure: MoyaProvider.neverStub,
                  callbackQueue: nil,
                  plugins: [MoyaProvider.networkLoggerPlugin()],
                  trackInflights: false)
    }

    public static func networkLoggerPlugin() -> NetworkLoggerPlugin {
        return NetworkLoggerPlugin()
    }

}

// MARK: - Private Methods

private extension MoyaProvider {

    static func JSONResponseDataFormatter(_ data: Data) -> Data {
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
            let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
            return prettyData
        } catch {
            return data // fallback to original data if it can't be serialized.
        }
    }

    static func JSONRequestDataFormatter(_ data: Data) -> String {
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
            let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
            if let convertedString = String(data: prettyData, encoding: String.Encoding.utf8) {
                return convertedString
            }
            return "Error mapping to string in plugin"
        } catch {
            return "Error mapping to string in plugin"
        }
    }

}
