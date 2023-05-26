import Foundation

struct CompanyEntity: Equatable {
    let id: String
    let name: String
    let kind: String
    let explanation: String
    let address: String
    let image: URL?
    let userId: String
    let createAt: Date
    let updateAt: Date
    let v: Int
}
