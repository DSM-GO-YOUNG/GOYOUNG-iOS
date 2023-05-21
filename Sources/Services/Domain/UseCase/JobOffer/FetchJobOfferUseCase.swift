import Foundation

import Combine

class FetchJobOfferUseCase {

    private let repository: Repository

    init(repository: Repository = RepositoryImpl()) {
        self.repository = repository
    }

    func execute() -> AnyPublisher<[JobOfferEntity], NetworkError> {
        return repository.fetchJobOffer()
    }

}
