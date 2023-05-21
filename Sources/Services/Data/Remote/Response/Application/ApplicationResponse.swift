import Foundation

struct ApplicationResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userId = "user_id"
        case jobOfferId = "job_offer_id"
        case content
        case result
        case createdAt
        case updatedAt
        case v = "__v"
    }
    let id: String
    let userId: String
    let jobOfferId: String
    let content: String
    let result: String
    let createdAt: String
    let updatedAt: String
    let v: Int
}

extension ApplicationResponse {
    func toDomain() -> ApplicationEntity {
        return .init(
            id: id,
            userId: userId,
            jobOfferId: jobOfferId,
            content: content,
            result: result,
            createdAt: createdAt.toDate(format: .fullDate),
            updatedAt: updatedAt.toDate(format: .fullDate),
            v: v
        )
    }
}
