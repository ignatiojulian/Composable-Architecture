//
//  RocketEndpoint.swift
//  TCA
//
//  Created by Ignatio Julian on 22/01/23.
//

internal enum RocketEndpoint {
    case getAllRocket
    case getRocketDetail(id: String)
}

extension RocketEndpoint: Endpoint {
    var host: String {
        return "api.spacexdata.com"
    }
    
    var path: String {
        switch self {
        case .getAllRocket:
            return "/v4/rockets"
        case .getRocketDetail(let id):
            return "/v4/rockets/\(id)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getAllRocket:
            return .get
        case .getRocketDetail:
            return .get
        }
    }
}
