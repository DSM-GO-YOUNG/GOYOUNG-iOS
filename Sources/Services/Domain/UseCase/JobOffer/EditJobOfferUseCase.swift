import Foundation

import Combine

class EditJobOfferUseCase {

    private let repository: Repository

    init(repository: Repository = RepositoryImpl()) {
        self.repository = repository
    }

    func execute(
        jobOfferId: String,
        content: String,
        job: String,
        address: String,
        startTime: String,
        endTime: String,
        welfare: String,
        condition: String,
        prefer: String
    ) -> AnyPublisher<Void, NetworkError> {
        return repository.editJobOffer(
            jobOfferId: jobOfferId,
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
