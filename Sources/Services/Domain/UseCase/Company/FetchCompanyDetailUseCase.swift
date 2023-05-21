import Foundation

import Combine

class FetchCompanyDetailUseCase {

    private let repository: Repository

    init(repository: Repository) {
        self.repository = repository
    }

    func execute(companyId: String) -> AnyPublisher<CompanyEntity, NetworkError> {
        return repository.fetchCompanyDetail(companyId: companyId)
    }

}
