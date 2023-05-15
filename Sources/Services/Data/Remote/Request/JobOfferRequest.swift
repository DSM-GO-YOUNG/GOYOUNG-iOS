import Foundation

struct JobOfferRequest: Encodable {
    private enum CodingKeys: String, CodingKey {
        case content
        case job
        case address
        case startTime = "start_time"
        case endTime = "end_time"
        case welfare
        case condition
        case prefer
    }
    let content: String
    let job: String
    let address: String
    let startTime: String
    let endTime: String
    let welfare: String
    let condition: String
    let prefer: String
}
