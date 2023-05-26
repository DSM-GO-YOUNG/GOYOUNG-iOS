import Foundation

import Combine

final class RepositoryImpl: Repository {

    let localDataSource: LocalDataSource
    let remoteDataSource: RemoteDataSource

    init(
        localDataSource: LocalDataSource = LocalDataSourceImpl(),
        remoteDataSource: RemoteDataSource = RemoteDataSourceImpl()
    ) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }

    func login(phoneNumber: String, password: String) -> AnyPublisher<Void, NetworkError> {
        return remoteDataSource.login(phoneNumber: phoneNumber, password: password)
            .map { self.localDataSource.registerAccessToken(accessToken: $0.accessToken) }
            .eraseToAnyPublisher()
    }
    func signup(phoneNumber: String, password: String, name: String) -> AnyPublisher<Void, NetworkError> {
        return remoteDataSource.signup(
            phoneNumber: phoneNumber,
            password: password,
            name: name
        )
    }
    func registrationCompany(
        image: Data,
        name: String,
        kind: String,
        explanation: String,
        address: String
    ) -> AnyPublisher<Void, NetworkError> {
        return remoteDataSource.registrationCompany(
            image: image,
            name: name,
            kind: kind,
            explanation: explanation,
            address: address
        )
    }
    func searchCompany(word: String) -> AnyPublisher<[CompanyEntity], NetworkError> {
        return remoteDataSource.searchCompany(word: word)
    }
    func fetchCompany() -> AnyPublisher<[CompanyEntity], NetworkError> {
        return remoteDataSource.fetchCompany()
    }
    func fetchCompanyDetail(companyId: String) -> AnyPublisher<CompanyEntity, NetworkError> {
        return remoteDataSource.fetchCompanyDetail(companyId: companyId)
    }
    func fetchMyCompany() -> AnyPublisher<CompanyEntity, NetworkError> {
        return remoteDataSource.fetchMyCompany()
    }
    func registrationJobOffer(companyId: String, request: JobOfferRequest) -> AnyPublisher<Void, NetworkError> {
        return remoteDataSource.registrationJobOffer(companyId: companyId, request: request)
    }
    func editJobOffer(jobOfferId: String, request: JobOfferRequest) -> AnyPublisher<Void, NetworkError> {
        return remoteDataSource.editJobOffer(jobOfferId: jobOfferId, request: request)
    }
    func deleteJobOffer(jobOfferId: String) -> AnyPublisher<Void, NetworkError> {
        return remoteDataSource.deleteJobOffer(jobOfferId: jobOfferId)
    }
    func fetchJobOffer() -> AnyPublisher<[JobOfferEntity], NetworkError> {
        return remoteDataSource.fetchJobOffer()
    }
    func fetchJobOfferDetail(jobOfferId: String) -> AnyPublisher<JobOfferEntity, NetworkError> {
        return remoteDataSource.fetchJobOfferDetail(jobOfferId: jobOfferId)
    }
    func fetchJobOfferByCompany(companyId: String) -> AnyPublisher<[JobOfferEntity], NetworkError> {
        return remoteDataSource.fetchJobOfferByCompany(companyId: companyId)
    }
    func fetchApplicationList(jobOfferId: String) -> AnyPublisher<[ApplicationEntity], NetworkError> {
        return remoteDataSource.fetchApplicationList(jobOfferId: jobOfferId)
    }
    func fetchApplicationDetail(applicationId: String) -> AnyPublisher<ApplicationEntity, NetworkError> {
        return remoteDataSource.fetchApplicationDetail(applicationId: applicationId)
    }
    func registrationResult(
        applicationId: String,
        result: ApplicationResultType
    ) -> AnyPublisher<Void, NetworkError> {
        return remoteDataSource.registrationResult(applicationId: applicationId, result: result)
    }

}
