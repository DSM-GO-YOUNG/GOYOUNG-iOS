import Foundation

import Combine

class FetchMyCompanyUseCase {

    private let repository: Repository

    init(repository: Repository = RepositoryImpl()) {
        self.repository = repository
    }

    func execute() -> AnyPublisher<CompanyEntity, NetworkError> {
        return repository.fetchMyCompany()
    }
}
