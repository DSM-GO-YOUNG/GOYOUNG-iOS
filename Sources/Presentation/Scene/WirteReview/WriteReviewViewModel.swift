import Foundation

import Combine

class WriteReviewViewModel: ObservableObject {
    @Published var content: String = ""
    @Published var isSuccess: Bool = false

    func writeReview() {
        self.content = ""
        self.isSuccess = true
    }
}
