import Foundation

struct JobOfferEntity: Equatable {
    let id: String
    let companyId: String
    let userId: String
    let content: String
    let job: String
    let address: String
    let startTime: Date
    let endTime: Date
    let welfare: String
    let condition: String
    let prefer: String
    let createdAt: Date
    let updatedAt: Date
    let v: Int
}
