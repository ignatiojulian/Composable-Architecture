//
//  Endpoint.swift
//  TCA
//
//  Created by Ignatio Julian on 22/01/23.
//

import Foundation

protocol Endpoint {
    var host: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var body: [String: Any]? { get }
}

extension Endpoint {
    var body: [String: Any]? { nil }
    
    var urlRequest: URLRequest? {
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = host
        urlComponent.path = path
        
        guard let url = urlComponent.url else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        
        if let jsonObject = body {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: jsonObject)
        }
        
        return urlRequest
    }
}
