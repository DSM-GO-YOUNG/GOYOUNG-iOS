import Foundation

import Combine

class SigninViewModel: ObservableObject {
    @Published var phoneNumber: String = ""
    @Published var password: String = ""
    @Published var isSuccess: Bool = false

    private let loginUseCase: LoginUseCase = .init()
    private var bag = Set<AnyCancellable>()

    func login() {
        self.loginUseCase.execute(
            phoneNumber: phoneNumber,
            password: password
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
