import Foundation

import Combine

class RegistrationResultUseCase {

    private let repository: Repository

    init(repository: Repository) {
        self.repository = repository
    }

    func execute(
        applicationId: String,
        result: ApplicationResultType
    ) -> AnyPublisher<Void, NetworkError> {
        return repository.registrationResult(
            applicationId: applicationId,
            result: result
        )
    }
}
