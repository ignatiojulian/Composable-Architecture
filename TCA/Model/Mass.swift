//
//  Mass.swift
//  RocketApp
//
//  Created by Ignatio Julian on 22/01/23.
//

internal struct Mass: Decodable, Equatable {
    internal let kilogram: Int
    internal let pound: Int

    private enum CodingKeys: String, CodingKey {
        case kilogram = "kg"
        case pound = "lb"
    }
}

extension Mass {
    internal init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        kilogram = try values.decodeIfPresent(Int.self, forKey: .kilogram) ?? 0
        pound = try values.decodeIfPresent(Int.self, forKey: .pound) ?? 0
    }
}
