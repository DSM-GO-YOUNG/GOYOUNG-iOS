import Foundation

import Combine

protocol RemoteDataSource {
    // user
    func login(phoneNumber: String, password: String) -> AnyPublisher<TokenResponse, NetworkError>
    func signup(phoneNumber: String, password: String, name: String) -> AnyPublisher<Void, NetworkError>

    // company
    func registrationCompany(image: Data, name: String, kind: String, explanation: String, address: String) -> AnyPublisher<Void, NetworkError>
    func editCompany(image: Data, name: String, kind: String, explanation: String, address: String) -> AnyPublisher<Void, NetworkError>
    func searchCompany(word: String) -> AnyPublisher<[CompanyEntity], NetworkError>
    func fetchCompany() -> AnyPublisher<[CompanyEntity], NetworkError>
    func fetchCompanyDetail(companyId: String) -> AnyPublisher<CompanyEntity, NetworkError>
    func fetchMyCompany() -> AnyPublisher<CompanyEntity, NetworkError>

    // job-offer
    func registrationJobOffer(companyId: String, request: JobOfferRequest) -> AnyPublisher<Void, NetworkError>
    func editJobOffer(jobOfferId: String, request: JobOfferRequest) -> AnyPublisher<Void, NetworkError>
    func deleteJobOffer(jobOfferId: String) -> AnyPublisher<Void, NetworkError>
    func fetchJobOffer() -> AnyPublisher<[JobOfferEntity], NetworkError>
    func fetchJobOfferDetail(jobOfferId: String) -> AnyPublisher<JobOfferEntity, NetworkError>
    func fetchJobOfferByCompany(companyId: String) -> AnyPublisher<[JobOfferEntity], NetworkError>

    // application
    func fetchApplicationList(jobOfferId: String) -> AnyPublisher<[ApplicationEntity], NetworkError>
    func fetchApplicationDetail(applicationId: String) -> AnyPublisher<ApplicationEntity, NetworkError>
    func registrationResult(applicationId: String, result: ApplicationResultType) -> AnyPublisher<Void, NetworkError>
}
