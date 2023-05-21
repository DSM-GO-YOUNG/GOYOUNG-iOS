import Foundation

import Combine

class FetchJobOfferByCompanyUseCase {

    private let repository: Repository

    init(repository: Repository) {
        self.repository = repository
    }

    func execute(companyId: String) -> AnyPublisher<[JobOfferEntity], NetworkError> {
        return repository.fetchJobOfferByCompany(companyId: companyId)
    }

}
