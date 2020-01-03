# GenericDecodable
GenericDecodable is a generic protocol to map any json response in Swift

# Json response cases: [Have extra key-value pairs, Have key with null value, Missing key-value pairs]

Solution: Ignore extra key-value, map the desired key-value and handle null with default value based on your business.

```
public extension KeyedDecodingContainer {
    func decodeWrapper<T>(key: K, defaultValue: T) throws -> T
        where T : Decodable {
        return try decodeIfPresent(T.self, forKey: key) ?? defaultValue
    }
}
