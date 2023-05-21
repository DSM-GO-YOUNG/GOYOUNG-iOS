import Foundation

import Combine

class RegistrationJobOfferUseCase {

    private let repository: Repository

    init(repository: Repository = RepositoryImpl()) {
        self.repository = repository
    }

    func execute(
        companyId: String,
        content: String,
        job: String,
        address: String,
        startTime: String,
        endTime: String,
        welfare: String,
        condition: String,
        prefer: String
    ) -> AnyPublisher<Void, NetworkError> {
        return repository.registrationJobOffer(
            companyId: companyId,
            request: .init(
                content: content,
                job: job,
                address: address,
                startTime: startTime,
                endTime: endTime,
                welfare: welfare,
                condition: condition,
                prefer: prefer
            ))
    }
}
