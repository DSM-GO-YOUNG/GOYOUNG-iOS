import Foundation

import Combine

class LoginUseCase {

    private let repository: Repository

    init(repository: Repository = RepositoryImpl()) {
        self.repository = repository
    }

    func execute(
        phoneNumber: String,
        password: String
    ) -> AnyPublisher<Void, NetworkError> {
        return repository.login(
            phoneNumber: phoneNumber,
            password: password
        )
    }
}
