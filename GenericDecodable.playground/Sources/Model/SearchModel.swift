import Foundation

public struct SearchModel {
    public var artistId: Int?
    public var trackId: Int?
    public var artistName: String?
}

extension SearchModel: Decodable {
    enum SearchModelCodingKeys: String, CodingKey {
        case artistId
        case trackId
        case artistName
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SearchModelCodingKeys.self)
        artistId = try container.decodeWrapper(key: .artistId, defaultValue: -1)
        trackId = try container.decodeWrapper(key: .trackId, defaultValue: -1)
        artistName = try container.decodeWrapper(key: .artistName, defaultValue: "")
    }
}
