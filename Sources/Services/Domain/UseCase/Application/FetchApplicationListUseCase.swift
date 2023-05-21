import Foundation

import Combine

class FetchApplicationListUseCase {

    private let repository: Repository

    init(reopsitory: Repository = RepositoryImpl()) {
        self.repository = reopsitory
    }

    func execute(jobOfferId: String) -> AnyPublisher<[ApplicationEntity], NetworkError> {
        return repository.fetchApplicationList(jobOfferId: jobOfferId)
    }
}
