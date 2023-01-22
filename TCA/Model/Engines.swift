//
//  Engines.swift
//  RocketApp
//
//  Created by Ignatio Julian on 22/01/23.
//

internal struct Engines: Decodable, Equatable {
    internal let specificImpulse: SpecificImpulse
    internal let thrustSeaLevel: Thrust
    internal let thrustVacuum: Thrust
    internal let number: Int
    internal let type: String
    internal let version: String
    internal let layout: String
    internal let engineLossMax: Int
    internal let firstPropellant: String
    internal let secondPropellant: String
    internal let thrustToWeight: Double

    private enum CodingKeys: String, CodingKey {
        case specificImpulse = "isp"
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case number
        case type
        case version
        case layout
        case engineLossMax = "engine_loss_max"
        case firstPropellant = "propellant_1"
        case secondPropellant = "propellant_2"
        case thrustToWeight = "thrust_to_weight"
    }
}

extension Engines {
    internal init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        specificImpulse = try values.decode(SpecificImpulse.self, forKey: .specificImpulse)
        thrustSeaLevel = try values.decode(Thrust.self, forKey: .thrustSeaLevel)
        thrustVacuum = try values.decode(Thrust.self, forKey: .thrustVacuum)
        number = try values.decodeIfPresent(Int.self, forKey: .number) ?? 0
        type = try values.decodeIfPresent(String.self, forKey: .type) ?? ""
        version = try values.decodeIfPresent(String.self, forKey: .version) ?? ""
        layout = try values.decodeIfPresent(String.self, forKey: .layout) ?? ""
        engineLossMax = try values.decodeIfPresent(Int.self, forKey: .engineLossMax) ?? 0
        firstPropellant = try values.decodeIfPresent(String.self, forKey: .firstPropellant) ?? ""
        secondPropellant = try values.decodeIfPresent(String.self, forKey: .secondPropellant) ?? ""
        thrustToWeight = try values.decodeIfPresent(Double.self, forKey: .thrustToWeight) ?? 0.0
    }
}
