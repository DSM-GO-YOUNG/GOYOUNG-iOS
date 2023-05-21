import Foundation

import Combine

class SearchCompanyUseCase {

    private let repository: Repository

    init(repository: Repository = RepositoryImpl()) {
        self.repository = repository
    }

    func execute(word: String) -> AnyPublisher<[CompanyEntity], NetworkError> {
        return repository.searchCompany(word: word)
    }
}
