//
//  SecondStage.swift
//  RocketApp
//
//  Created by Ignatio Julian on 22/01/23.
//

internal struct SecondStage: Decodable, Equatable {
    internal let thrust: Thrust
    internal let payloads: Payloads
    internal let reusable: Bool
    internal let engines: Int
    internal let fuelAmountTons: Double
    internal let burnTimeSec: Int

    private enum CodingKeys: String, CodingKey {
        case thrust
        case payloads
        case reusable
        case engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSec = "burn_time_sec"
    }
}

extension SecondStage {
    internal init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        thrust = try values.decode(Thrust.self, forKey: .thrust)
        payloads = try values.decode(Payloads.self, forKey: .payloads)
        reusable = try values.decodeIfPresent(Bool.self, forKey: .reusable) ?? false
        engines = try values.decodeIfPresent(Int.self, forKey: .engines) ?? 0
        fuelAmountTons = try values.decodeIfPresent(Double.self, forKey: .fuelAmountTons) ?? 0.0
        burnTimeSec = try values.decodeIfPresent(Int.self, forKey: .burnTimeSec) ?? 0
    }
}
