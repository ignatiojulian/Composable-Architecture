//
//  Rocket.swift
//  RocketApp
//
//  Created by Ignatio Julian on 22/01/23.
//

internal struct Rocket: Decodable, Equatable, Identifiable {
    internal let height: Length
    internal let diameter: Length
    internal let mass: Mass
    internal let firstStage: FirstStage
    internal let secondStage: SecondStage
    internal let engines: Engines
    internal let landingLegs: LandingLegs
    internal let payloadWeights: [PayloadWeight]
    internal let flickrImages: [String]
    internal let name: String
    internal let type: String
    internal let active: Bool
    internal let stages: Int
    internal let boosters: Int
    internal let costPerLaunch: Int
    internal let successRatePct: Int
    internal let firstFlight: String
    internal let country: String
    internal let company: String
    internal let wikipedia: String
    internal let description: String
    internal let id: String

    private enum CodingKeys: String, CodingKey {
        case height
        case diameter
        case mass
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case engines
        case landingLegs = "landing_legs"
        case payloadWeights = "payload_weights"
        case flickrImages = "flickr_images"
        case name
        case type
        case active
        case stages
        case boosters
        case costPerLaunch = "cost_per_launch"
        case successRatePct = "success_rate_pct"
        case firstFlight = "first_flight"
        case country
        case company
        case wikipedia
        case description
        case id
    }
}

extension Rocket {
    internal init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        height = try values.decode(Length.self, forKey: .height)
        diameter = try values.decode(Length.self, forKey: .diameter)
        mass = try values.decode(Mass.self, forKey: .mass)
        firstStage = try values.decode(FirstStage.self, forKey: .firstStage)
        secondStage = try values.decode(SecondStage.self, forKey: .secondStage)
        engines = try values.decode(Engines.self, forKey: .engines)
        landingLegs = try values.decode(LandingLegs.self, forKey: .landingLegs)
        payloadWeights = try values.decode([PayloadWeight].self, forKey: .payloadWeights)
        flickrImages = try values.decode([String].self, forKey: .flickrImages)
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        type = try values.decodeIfPresent(String.self, forKey: .type) ?? ""
        active = try values.decodeIfPresent(Bool.self, forKey: .active) ?? false
        stages = try values.decodeIfPresent(Int.self, forKey: .stages) ?? 0
        boosters = try values.decodeIfPresent(Int.self, forKey: .boosters) ?? 0
        costPerLaunch = try values.decodeIfPresent(Int.self, forKey: .costPerLaunch) ?? 0
        successRatePct = try values.decodeIfPresent(Int.self, forKey: .successRatePct) ?? 0
        firstFlight = try values.decodeIfPresent(String.self, forKey: .firstFlight) ?? ""
        country = try values.decodeIfPresent(String.self, forKey: .country) ?? ""
        company = try values.decodeIfPresent(String.self, forKey: .company) ?? ""
        wikipedia = try values.decodeIfPresent(String.self, forKey: .wikipedia) ?? ""
        description = try values.decodeIfPresent(String.self, forKey: .description) ?? ""
        id = try values.decodeIfPresent(String.self, forKey: .id) ?? ""
    }
}
