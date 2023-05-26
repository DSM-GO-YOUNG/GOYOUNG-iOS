import Foundation

import Combine

class ApplicationListViewModel: ObservableObject {
    @Published var applicationList: [ApplicationEntity] = []

    private let fetchApplicationListUseCase: FetchApplicationListUseCase = .init()
    private var bag = Set<AnyCancellable>()

    func fetchApplicationList() {
        self.fetchApplicationListUseCase.execute(jobOfferId: "")
            .catch { error -> Empty<[ApplicationEntity], Never> in
                return .init()
            }
            .sink {
                self.applicationList = $0
            }
            .store(in: &bag)
    }

}
