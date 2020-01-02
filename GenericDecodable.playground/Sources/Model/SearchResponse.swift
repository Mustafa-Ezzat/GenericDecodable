import Foundation

public struct SearchResponse {
    public var resultCount: Int?
    public var results: [SearchModel]?
}

extension SearchResponse: Decodable {
    enum SearchResponseCodingKeys: String, CodingKey {
        case resultCount
        case results
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SearchResponseCodingKeys.self)
        resultCount = try container.decodeWrapper(key: .resultCount, defaultValue: -1)
        results = try container.decodeWrapper(key: .results, defaultValue: [])
    }
}
