//
//  Moya+Extra.swift
//  MapTask
//
//  Created by Domagoj Grizelj on 28.04.2021..
//

import Foundation
import Moya

// MARK: - Plugin extension

typealias RemoteResponse<C> = (Result<C, MoyaError>) -> Void

extension MoyaProvider {

    public convenience init() {
        self.init(endpointClosure: MoyaProvider.defaultEndpointMapping,
                  requestClosure: MoyaProvider.defaultRequestMapping,
                  stubClosure: MoyaProvider.neverStub,
                  callbackQueue: nil,
                  plugins: [MoyaProvider.networkLoggerPlugin()],
                  trackInflights: false)
    }

    @discardableResult func httpRequest<C: Codable>(_ target: Target, completion: RemoteResponse<C>?) -> Cancellable {
        return self.request(target) { (result) in
            switch result {
            case .success(let response):
                do {
                    let object = try response.map(C.self)
                    completion!(.success(object))
                } catch {
                    completion!(.failure(MoyaError.jsonMapping(response)))
                }

            case .failure(let error):
                completion!(.failure(error))
            }
        }
    }

    public static func networkLoggerPlugin() -> NetworkLoggerPlugin {
        let configuration = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        return NetworkLoggerPlugin(configuration: configuration)
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
