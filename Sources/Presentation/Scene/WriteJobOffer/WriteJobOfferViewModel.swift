import Foundation

import Combine

class WriteJobOfferViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var workDay: String = ""
    @Published var startTime: String = ""
    @Published var endTime: String = ""
    @Published var work: String = ""
    @Published var welfare: String = ""
    @Published var condition: String = ""
    @Published var prefer: String = ""

    private let writeJobOfferUseCase: RegistrationJobOfferUseCase = .init()
    private var bag = Set<AnyCancellable>()

    func writeJobOffer() { 
    }
}
