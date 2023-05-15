import Foundation

import KeychainSwift

protocol LocalDataSource {
    func registerAccessToken(accessToken: String)
    func fetchAccessToken() -> String
    func removeAccessToken()
}
