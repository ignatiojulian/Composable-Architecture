//
//  NetworkService.swift
//  TCA
//
//  Created by Ignatio Julian on 22/01/23.
//

import Foundation

protocol NetworkServiceProtocol {
    func request<T: Decodable, E: Endpoint>(to endpoint: E, decodeTo model: T.Type) async -> Result<T, NetworkError>
}

internal class NetworkService: NetworkServiceProtocol {
    func request<T, E>(to endpoint: E, decodeTo model: T.Type) async -> Result<T, NetworkError> where T : Decodable, E : Endpoint {
        guard let urlRequest = endpoint.urlRequest else { return .failure(.invalidRequest) }
        
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)

            guard let decodeData = try? JSONDecoder().decode(model, from: data) else { return .failure(.decodeFailure) }
            
            return .success(decodeData)
        } catch {
            return .failure(.underlyingError)
        }
    }
}
