// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let episode = try? JSONDecoder().decode(Episode.self, from: jsonData)

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - Episode
public struct Episode: Codable, Equatable {
    public let name: String?
    public let air_date: String?
    public let episode: String?

    public enum CodingKeys: String, CodingKey {
        case name
        case air_date
        case episode
    }

    public init(name: String?, airDate: String?, episode: String?) {
        self.name = name
        self.air_date = airDate
        self.episode = episode
    }
}
