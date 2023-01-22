//
//  Payloads.swift
//  RocketApp
//
//  Created by Ignatio Julian on 22/01/23.
//

internal struct Payloads: Decodable, Equatable {
    internal let compositeFairing: CompositeFairing
    internal let option: String

    private enum CodingKeys: String, CodingKey {
        case compositeFairing = "composite_fairing"
        case option = "option_1"
    }
}

extension Payloads {
    internal init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        compositeFairing = try values.decode(CompositeFairing.self, forKey: .compositeFairing)
        option = try values.decodeIfPresent(String.self, forKey: .option) ?? ""
    }
}
