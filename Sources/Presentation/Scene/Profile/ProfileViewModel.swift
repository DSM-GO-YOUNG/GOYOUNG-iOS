import Foundation

import Combine

class ProfileViewModel: ObservableObject {
    @Published var company: CompanyEntity?
    @Published var notFoundCompany: Bool = false

    private let fetchMyCompanyUseCase: FetchMyCompanyUseCase = .init()
    private var bag = Set<AnyCancellable>()

    func fetchMyCompany() {
        self.fetchMyCompanyUseCase.execute()
            .catch { error -> Empty<CompanyEntity, Never> in
                if error == .notFound {
                    self.notFoundCompany = true
                }
                return .init()
            }
            .sink {
                self.company = $0
            }
            .store(in: &bag)
    }

}
