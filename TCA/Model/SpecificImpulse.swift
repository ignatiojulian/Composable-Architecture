//
//  SpecificImpulse.swift
//  RocketApp
//
//  Created by Ignatio Julian on 22/01/23.
//

internal struct SpecificImpulse: Decodable, Equatable {
    internal let seaLevel: Int
    internal let vacuum: Int

    private enum CodingKeys: String, CodingKey {
        case seaLevel = "sea_level"
        case vacuum
    }
}

extension SpecificImpulse {
    internal init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        seaLevel = try values.decodeIfPresent(Int.self, forKey: .seaLevel) ?? 0
        vacuum = try values.decodeIfPresent(Int.self, forKey: .vacuum) ?? 0
    }
}
