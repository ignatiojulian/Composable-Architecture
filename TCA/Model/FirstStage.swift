//
//  FirstStage.swift
//  RocketApp
//
//  Created by Ignatio Julian on 22/01/23.
//

internal struct FirstStage: Decodable, Equatable {
    internal let thrustSeaLevel: Thrust
    internal let thrustVacuum: Thrust
    internal let reusable: Bool
    internal let engines: Int
    internal let fuelAmountTons: Double
    internal let burnTimeSec: Int

    private enum CodingKeys: String, CodingKey {
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case reusable
        case engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSec = "burn_time_sec"
    }
}

extension FirstStage {
    internal init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        thrustSeaLevel = try values.decode(Thrust.self, forKey: .thrustSeaLevel)
        thrustVacuum = try values.decode(Thrust.self, forKey: .thrustVacuum)
        reusable = try values.decodeIfPresent(Bool.self, forKey: .reusable) ?? false
        engines = try values.decodeIfPresent(Int.self, forKey: .engines) ?? 0
        fuelAmountTons = try values.decodeIfPresent(Double.self, forKey: .fuelAmountTons) ?? 0.0
        burnTimeSec = try values.decodeIfPresent(Int.self, forKey: .burnTimeSec) ?? 0
    }
}
