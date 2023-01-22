//
//  NetworkError.swift
//  TCA
//
//  Created by Ignatio Julian on 22/01/23.
//

internal enum NetworkError: Error {
    case invalidRequest
    case decodeFailure
    case underlyingError
}

