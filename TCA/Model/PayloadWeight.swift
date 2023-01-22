//
//  PayloadWeight.swift
//  RocketApp
//
//  Created by Ignatio Julian on 22/01/23.
//

internal struct PayloadWeight: Decodable, Equatable {
    internal let id: String
    internal let name: String
    internal let kilogram: Int
    internal let pound: Int

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case kilogram = "kg"
        case pound = "lb"
    }
}

extension PayloadWeight {
    internal init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        id = try values.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        kilogram = try values.decodeIfPresent(Int.self, forKey: .kilogram) ?? 0
        pound = try values.decodeIfPresent(Int.self, forKey: .pound) ?? 0
    }
}
