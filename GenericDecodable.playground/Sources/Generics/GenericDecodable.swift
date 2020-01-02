import Foundation

public protocol GenericDecodable {
    associatedtype T
    func map(_ data: Data, completion: @escaping (Result<T, Error>) -> Void)
}

public extension GenericDecodable where T: Decodable {
    func map(_ data: Data, completion: @escaping (Result<T, Error>) -> Void) {
        do {
            let decodableResponse = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodableResponse))
        } catch {
            completion(.failure(error))
        }
    }
}
