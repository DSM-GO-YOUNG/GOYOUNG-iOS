import Foundation

import Combine

class HomeViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var companyList: [CompanyEntity] = []
    @Published var searchList: [CompanyEntity] = []

    private let fetchCompanyUseCase: FetchCompanyUseCase = .init()
    private var bag = Set<AnyCancellable>()

    func fetchCompany() {
        self.fetchCompanyUseCase.execute()
            .catch { error -> Empty<[CompanyEntity], Never> in
                self.companyList = []
                return .init()
            }
            .sink {
                self.companyList = $0
                self.searchList = $0
            }
            .store(in: &bag)
    }

    func searchCompany() {
        if searchText.isEmpty {
            self.companyList = searchList
        } else {
            self.companyList = self.searchList.filter { $0.name.contains(self.searchText) }
        }
    }

}
