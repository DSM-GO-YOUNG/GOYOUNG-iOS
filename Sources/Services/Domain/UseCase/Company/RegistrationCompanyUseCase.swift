import Foundation

import Combine

class RegistrationCompanyUseCase {

    private let repository: Repository

    init(repository: Repository = RepositoryImpl()) {
        self.repository = repository
    }

    func execute(
        name: String,
        kind: String,
        explanation: String,
        address: String
    ) -> AnyPublisher<Void, NetworkError> {
        return repository.registrationCompany(
            name: name,
            kind: kind,
            explanation: explanation,
            address: address
        )
    }
}
