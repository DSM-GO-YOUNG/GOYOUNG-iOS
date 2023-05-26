import Foundation

import Combine
import UIKit

class RegistrationCompanyViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var kind: String = ""
    @Published var address: String = ""
    @Published var content: String = ""
    @Published var imageUrl: URL?
    @Published var image: UIImage = UIImage()
    @Published var isSuccess: Bool = false

    private let registrationCompanyUseCase: RegistrationCompanyUseCase = .init()
    private var bag = Set<AnyCancellable>()

    func registrationCompany() {
        self.registrationCompanyUseCase.execute(
            image: image.jpegData(compressionQuality: 0.5) ?? Data(),
            name: name,
            kind: kind,
            explanation: content,
            address: address
        )
        .catch { error -> Empty<Void, Never> in
            self.isSuccess = false
            return .init()
        }
        .sink { _ in
            self.isSuccess = true
        }
        .store(in: &bag)
    }

}
