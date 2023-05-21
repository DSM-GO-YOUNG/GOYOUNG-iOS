import Foundation

import Combine

class SignupViewModel: ObservableObject {
    @Published var phoneNumber: String = ""
    @Published var password: String = ""
    @Published var name: String = ""
    @Published var isSuccess: Bool = false

    private let signupUseCase: SignupUseCase = .init()
    private var bag = Set<AnyCancellable>()

    func signup() {
        self.signupUseCase.execute(
            phoneNumber: phoneNumber,
            password: password,
            name: name
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
