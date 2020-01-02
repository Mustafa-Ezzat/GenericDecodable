import Foundation

public enum Result<Success, Failure: Error> {
    case success(Success)
    case failure(Failure)
}
