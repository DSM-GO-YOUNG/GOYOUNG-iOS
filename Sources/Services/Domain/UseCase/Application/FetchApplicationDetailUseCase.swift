import Foundation

import Combine

class FetchApplicationDetailUseCase {

    private let repository: Repository

    init(repository: Repository = RepositoryImpl()) {
        self.repository = repository
    }

    func execute(applicationId: String) -> AnyPublisher<ApplicationEntity, NetworkError> {
        return repository.fetchApplicationDetail(applicationId: applicationId)
    }
}
