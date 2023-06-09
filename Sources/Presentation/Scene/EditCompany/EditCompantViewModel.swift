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

    private let editCompanyUseCase: EditCompanyUseCase = .init()
    private var bag = Set<AnyCancellable>()

    func editCompany() {
        self.editCompanyUseCase.execute(
            image: image.jpegData(compressionQuality: 0.5) ?? Data(),
            name: name,
            kind: kind,
            explanation: content,
            address: address
        )
        .catch { error -> Empty<Void, Never> in
            print(error)
            self.isSuccess = false
            return .init()
        }
        .sink { _ in
            self.isSuccess = true
        }
        .store(in: &bag)
    }
}
