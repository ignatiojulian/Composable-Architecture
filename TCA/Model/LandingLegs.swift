//
//  LandingLegs.swift
//  RocketApp
//
//  Created by Ignatio Julian on 22/01/23.
//

internal struct LandingLegs: Decodable, Equatable {
    internal let number: Int
    internal let material: String

    private enum CodingKeys: String, CodingKey {
        case number
        case material
    }
}

extension LandingLegs {
    internal init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        number = try values.decodeIfPresent(Int.self, forKey: .number) ?? 0
        material = try values.decodeIfPresent(String.self, forKey: .material) ?? ""
    }
}
