import Foundation

import Combine

class FetchJobOfferDetailUseCase {

    private let repository: Repository

    init(repository: Repository = RepositoryImpl()) {
        self.repository = repository
    }

    func execute(jobOfferId: String) -> AnyPublisher<JobOfferEntity, NetworkError> {
        return repository.fetchJobOfferDetail(jobOfferId: jobOfferId)
    }
}
