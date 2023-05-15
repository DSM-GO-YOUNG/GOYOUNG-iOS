import Foundation

struct CompanyResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case kind
        case explanation
        case address
        case userId = "user_id"
        case createAt = "create_at"
        case updateAt = "update_at"
        case v = "_v"
    }
    let id: String
    let name: String
    let kind: String
    let explanation: String
    let address: String
    let userId: String
    let createAt: String
    let updateAt: String
    let v: Int
}

extension CompanyResponse {
    func toDomain() -> CompanyEntity {
        return .init(
            id: id,
            name: name,
            kind: kind,
            explanation: explanation,
            address: address,
            userId: userId,
            createAt: createAt.toDate(format: .fullDate),
            updateAt: updateAt.toDate(format: .fullDate),
            v: v
        )
    }
}
