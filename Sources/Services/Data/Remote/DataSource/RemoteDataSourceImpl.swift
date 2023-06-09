import Foundation

import Combine
import CombineMoya
import Moya

final class RemoteDataSourceImpl: RemoteDataSource {

    let provider = MoyaProvider<API>()

    func login(
        phoneNumber: String,
        password: String
    ) -> AnyPublisher<TokenResponse, NetworkError> {
        return provider.requestPublisher(.login(
            phoneNumber: phoneNumber,
            password: password
        ), TokenResponse.self)
    }

    func signup(phoneNumber: String, password: String, name: String) -> AnyPublisher<Void, NetworkError> {
        return provider.requestVoidPublisher(.signup(phoneNumber: phoneNumber, password: password, name: name))
    }

    func registrationCompany(
        image: Data,
        name: String,
        kind: String,
        explanation: String,
        address: String
    ) -> AnyPublisher<Void, NetworkError> {
        return provider.requestVoidPublisher(.registrationCompany(
            image: image,
            name: name,
            kind: kind,
            explanation: explanation,
            address: address
        ))
    }

    func editCompany(
        image: Data,
        name: String,
        kind: String,
        explanation: String,
        address: String
    ) -> AnyPublisher<Void, NetworkError> {
        return provider.requestVoidPublisher(.registrationCompany(
            image: image,
            name: name,
            kind: kind,
            explanation: explanation,
            address: address
        ))
    }

    func searchCompany(word: String) -> AnyPublisher<[CompanyEntity], NetworkError> {
        return provider.requestPublisher(.searchCompany(word: word), [CompanyResponse].self)
            .map { $0.map { $0.toDomain() } }
            .eraseToAnyPublisher()
    }

    func fetchCompany() -> AnyPublisher<[CompanyEntity], NetworkError> {
        return provider.requestPublisher(.fetchCompany, [CompanyResponse].self)
            .map { $0.map { $0.toDomain() } }
            .eraseToAnyPublisher()
    }

    func fetchCompanyDetail(companyId: String) -> AnyPublisher<CompanyEntity, NetworkError> {
        return provider.requestPublisher(.fetchCompanyDetail(companyId: companyId), CompanyResponse.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    func fetchMyCompany() -> AnyPublisher<CompanyEntity, NetworkError> {
        return provider.requestPublisher(.fetchMyCompany, CompanyResponse.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    func registrationJobOffer(companyId: String, request: JobOfferRequest) -> AnyPublisher<Void, NetworkError> {
        return provider.requestVoidPublisher(.registrationJobOffer(companyId: companyId, request: request))
    }

    func editJobOffer(jobOfferId: String, request: JobOfferRequest) -> AnyPublisher<Void, NetworkError> {
        return provider.requestVoidPublisher(.editJobOffer(jobOfferId: jobOfferId, request: request))
    }

    func deleteJobOffer(jobOfferId: String) -> AnyPublisher<Void, NetworkError> {
        return provider.requestVoidPublisher(.deleteJobOffer(jobOfferId: jobOfferId))
    }

    func fetchJobOffer() -> AnyPublisher<[JobOfferEntity], NetworkError> {
        return provider.requestPublisher(.fetchJobOffer, [JobOfferResponse].self)
            .map { $0.map { $0.toDomain() } }
            .eraseToAnyPublisher()
    }

    func fetchJobOfferDetail(jobOfferId: String) -> AnyPublisher<JobOfferEntity, NetworkError> {
        return provider.requestPublisher(.fetchJobOfferDetail(jobOfferId: jobOfferId), JobOfferResponse.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    func fetchJobOfferByCompany(companyId: String) -> AnyPublisher<[JobOfferEntity], NetworkError> {
        return provider.requestPublisher(.fetchJobOfferByCompany(companyId: companyId), [JobOfferResponse].self)
            .map { $0.map { $0.toDomain() } }
            .eraseToAnyPublisher()
    }

    func fetchApplicationList(jobOfferId: String) -> AnyPublisher<[ApplicationEntity], NetworkError> {
        return provider.requestPublisher(
            .fetchApplicationList(jobOfferId: jobOfferId),
            [ApplicationResponse].self
        )
        .map { $0.map { $0.toDomain() } }
        .eraseToAnyPublisher()
    }
    
    func fetchApplicationDetail(applicationId: String) -> AnyPublisher<ApplicationEntity, NetworkError> {
        return provider.requestPublisher(.fetchApplicationDetail(applicationId: applicationId), ApplicationResponse.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
    
    func registrationResult(
        applicationId: String,
        result: ApplicationResultType
    ) -> AnyPublisher<Void, NetworkError> {
        return provider.requestVoidPublisher(.registrationResult(
            applicationId: applicationId,
            result: result)
        )
    }
    
}
