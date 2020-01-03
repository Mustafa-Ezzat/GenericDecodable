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
