import Foundation

struct JobOfferResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case companyId = "company_id"
        case userId = "user_id"
        case content
        case job
        case address
        case startTime = "start_time"
        case endTime = "end_time"
        case welfare
        case condition
        case prefer
        case createdAt
        case updatedAt
        case v = "__v"
    }
    let id: String
    let companyId: String
    let userId: String
    let content: String
    let job: String
    let address: String
    let startTime: String
    let endTime: String
    let welfare: String
    let condition: String
    let prefer: String
    let createdAt: String
    let updatedAt: String
    let v: Int
}

extension JobOfferResponse {
    func toDomain() -> JobOfferEntity {
        return .init(
            id: id,
            companyId: companyId,
            userId: userId,
            content: content,
            job: job,
            address: address,
            startTime: startTime.toDate(format: .fullDate),
            endTime: endTime.toDate(format: .fullDate),
            welfare: welfare,
            condition: condition,
            prefer: prefer,
            createdAt: createdAt.toDate(format: .fullDate),
            updatedAt: updatedAt.toDate(format: .fullDate),
            v: v
        )
    }
}
