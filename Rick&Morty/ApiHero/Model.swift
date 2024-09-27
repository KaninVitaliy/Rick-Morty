// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cityDetails = try? JSONDecoder().decode(CityDetails.self, from: jsonData)

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - CityDetails
public struct Characters: Codable, Equatable {
    public let info: Info?
    public let results: [Result]?

    public enum CodingKeys: String, CodingKey {
        case info
        case results
    }

    public init(info: Info?, results: [Result]?) {
        self.info = info
        self.results = results
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Info
public struct Info: Codable, Equatable {
    public let count: Int?
    public let pages: Int?
    public let next: String?
    public let prev: JSONNull?

    public enum CodingKeys: String, CodingKey {
        case count
        case pages
        case next
        case prev
    }

    public init(count: Int?, pages: Int?, next: String?, prev: JSONNull?) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Result
public struct Result: Codable, Equatable {
    public let id: Int?
    public let name: String?
    public let status: Status?
    public let species: Species?
    public let type: String?
    public let gender: Gender?
    public let origin: Location?
    public let location: Location?
    public let image: String?
    public let episode: [String]?
    public let url: String?
    public let created: String?

    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case type
        case gender
        case origin
        case location
        case image
        case episode
        case url
        case created
    }

    public init(id: Int?, name: String?, status: Status?, species: Species?, type: String?, gender: Gender?, origin: Location?, location: Location?, image: String?, episode: [String]?, url: String?, created: String?) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}

public enum Gender: String, Codable, Equatable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Location
public struct Location: Codable, Equatable {
    public let name: String?
    public let url: String?

    public enum CodingKeys: String, CodingKey {
        case name
        case url
    }

    public init(name: String?, url: String?) {
        self.name = name
        self.url = url
    }
}

public enum Species: String, Codable, Equatable {
    case alien = "Alien"
    case human = "Human"
}

public enum Status: String, Codable, Equatable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

// MARK: - Encode/decode helpers

public class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
    }

    public var hashValue: Int {
            return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
    }

    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
    }
}
