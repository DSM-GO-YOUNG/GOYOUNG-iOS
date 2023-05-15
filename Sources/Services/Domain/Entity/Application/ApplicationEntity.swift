import Foundation

struct ApplicationEntity: Equatable {
    let id: String
    let userId: String
    let jobOfferId: String
    let content: String
    let result: String
    let createdAt: Date
    let updatedAt: Date
    let v: Int
}
