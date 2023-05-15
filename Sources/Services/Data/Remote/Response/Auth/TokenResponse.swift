import Foundation

struct TokenResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case accessToken = "access_token"
    }
    let id: String
    let accessToken: String
}
