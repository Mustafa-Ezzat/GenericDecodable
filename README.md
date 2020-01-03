# GenericDecodable
GenericDecodable is a generic protocol to map any json response in Swift

The problem: Imagine your JSON response has extra unnecessary key-value pairs, has the desired key with null value or missing desired key-value pairs.

The solution: Ignore extra key-value pairs, map only the desired key-value pairs and handle null with the default value based on your business requirements.

```
public extension KeyedDecodingContainer {
    func decodeWrapper<T>(key: K, defaultValue: T) throws -> T
        where T : Decodable {
        return try decodeIfPresent(T.self, forKey: key) ?? defaultValue
    }
}
```

# Usage

```
struct SearchModel {
    var artistId: Int?
    var trackId: Int?
    var artistName: String?
}

extension SearchModel: Decodable {
    enum SearchModelCodingKeys: String, CodingKey {
        case artistId
        case trackId
        case artistName
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SearchModelCodingKeys.self)
        artistId = try container.decodeWrapper(key: .artistId, defaultValue: -1)
        trackId = try container.decodeWrapper(key: .trackId, defaultValue: -1)
        artistName = try container.decodeWrapper(key: .artistName, defaultValue: "")
    }
}
