import Foundation

struct CompanyResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case kind
        case explanation
        case address
        case image
        case userId = "user_id"
        case createdAt
        case updatedAt
        case v = "__v"
    }
    let id: String
    let name: String
    let kind: String
    let explanation: String
    let address: String
    let image: String
    let userId: String
    let createdAt: String
    let updatedAt: String
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
            image: URL(string: image),
            userId: userId,
            createAt: createdAt.toDate(format: .fullDateWithMilliSecondTime),
            updateAt: updatedAt.toDate(format: .fullDateWithMilliSecondTime),
            v: v
        )
    }
}
