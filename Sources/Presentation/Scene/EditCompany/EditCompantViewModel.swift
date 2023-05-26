import Foundation

import Combine
import UIKit

class EditCompanyViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var kind: String = ""
    @Published var address: String = ""
    @Published var content: String = ""
    @Published var imageUrl: URL?
    @Published var image: UIImage = UIImage()
    @Published var isSuccess: Bool = false
}
