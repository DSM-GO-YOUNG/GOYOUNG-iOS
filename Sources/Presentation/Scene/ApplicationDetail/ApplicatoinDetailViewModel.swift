import Foundation

import Combine

class ApplicatoinDetailViewModel: ObservableObject {
    @Published var applicationEntity: ApplicationEntity?

    private let fetchApplicationDetailUseCase: FetchApplicationDetailUseCase = .init()
    private var bag = Set<AnyCancellable>()

    func fetchApplicationDetail(id: String) {
        self.fetchApplicationDetailUseCase.execute(applicationId: id)
            .catch { error -> Empty<ApplicationEntity, Never> in
                print(error)
                return .init()
            }
            .sink {
                self.applicationEntity = $0
            }
            .store(in: &bag)
    }
}
