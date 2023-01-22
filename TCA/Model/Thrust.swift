//
//  Thrust.swift
//  RocketApp
//
//  Created by Ignatio Julian on 22/01/23.
//

internal struct Thrust: Decodable, Equatable {
    internal let kilonewton: Int
    internal let poundForce: Int

    private enum CodingKeys: String, CodingKey {
        case kilonewton = "kN"
        case poundForce = "lbf"
    }
}

extension Thrust {
    internal init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        kilonewton = try values.decodeIfPresent(Int.self, forKey: .kilonewton) ?? 0
        poundForce = try values.decodeIfPresent(Int.self, forKey: .poundForce) ?? 0
    }
}
