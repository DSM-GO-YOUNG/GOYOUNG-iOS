import Foundation

import Combine

class DeleteJobOfferUseCase {

    private let repository: Repository

    init(repository: Repository = RepositoryImpl()) {
        self.repository = repository
    }

    func execute(jobOfferId: String) -> AnyPublisher<Void, NetworkError> {
        return repository.deleteJobOffer(jobOfferId: jobOfferId)
    }
}
