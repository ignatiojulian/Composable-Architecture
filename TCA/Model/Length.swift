//
//  Length.swift
//  RocketApp
//
//  Created by Ignatio Julian on 22/01/23.
//

internal struct Length: Decodable, Equatable {
    internal let meters: Double
    internal let feet: Double

    private enum CodingKeys: String, CodingKey {
        case meters
        case feet
    }
}

extension Length {
    internal init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        meters = try values.decodeIfPresent(Double.self, forKey: .meters) ?? 0.0
        feet = try values.decodeIfPresent(Double.self, forKey: .feet) ?? 0.0
    }
}
