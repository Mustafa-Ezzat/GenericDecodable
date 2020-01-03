# GenericDecodable
GenericDecodable is a generic protocol to map any json response in Swift

# Json response cases:

1- Have extra key-value
2- Have Key with null value
3- Missing key

Solution: Ignore extra key-value, map the desired key-value and handle null with default value based on your business.

```
public extension KeyedDecodingContainer {
    func decodeWrapper<T>(key: K, defaultValue: T) throws -> T
        where T : Decodable {
        return try decodeIfPresent(T.self, forKey: key) ?? defaultValue
    }
}
