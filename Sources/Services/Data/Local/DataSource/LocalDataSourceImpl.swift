import Foundation

import KeychainSwift

final class LocalDataSourceImpl: LocalDataSource {

    private let keychain = KeychainSwift()

    func registerAccessToken(accessToken: String) {
        keychain.delete("access_token")
        keychain.set(accessToken, forKey: "access_token")
    }

    func fetchAccessToken() -> String {
        return keychain.get("access_token") ?? ""
    }

    func removeAccessToken() {
        keychain.delete("access_token")
    }

}
