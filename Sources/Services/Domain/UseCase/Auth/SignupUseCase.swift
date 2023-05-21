import Foundation

import Combine

class SignupUseCase {

    private let repository: Repository

    init(repository: Repository = RepositoryImpl()) {
        self.repository = repository
    }

    func execute(
        phoneNumber: String,
        password: String,
        name: String
    ) -> AnyPublisher<Void, NetworkError> {
        return repository.signup(
            phoneNumber: phoneNumber,
            password: password,
            name: name
        )
    }
}
