import Foundation

import Moya

enum NetworkError: Int, Error {
    case success = 200
    case postSuccess = 201
    case deleteSuccess = 204
    case badRequest = 400
    case tokenError = 401
    case forbidden = 403
    case notFound = 404
    case conflict = 409
    case notResponse = 1
    case fail = 0
    
    init(_ error: MoyaError) {
        if error.response == nil {
            self = .notResponse
        } else {
            let code = error.response!.statusCode
            let networkError = NetworkError(rawValue: code)
            self = networkError ?? .fail
        }
    }
    
    init(_ error: Error) {
        if let moyaErr = error as? MoyaError {
            self = NetworkError(moyaErr)
        } else {
            self = .fail
        }
    }

}
