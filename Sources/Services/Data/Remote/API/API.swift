import Foundation

import Moya

enum API {
    // user
    case login(phoneNumber: String, password: String)
    case signup(phoneNumber: String, password: String, name: String)

    // company
    case registrationCompany(name: String, kind: String, explanation: String, address: String)
    case searchCompany(word: String)
    case fetchCompany
    case fetchCompanyDetail(companyId: String)

    // job-offer
    case registrationJobOffer(companyId: String, request: JobOfferRequest)
    case editJobOffer(jobOfferId: String, request: JobOfferRequest)
    case deleteJobOffer(jobOfferId: String)
    case fetchJobOffer
    case fetchJobOfferDetail(jobOfferId: String)
    case fetchJobOfferByCompany(companyId: String)

    // application
    case fetchApplicationList(jobOfferId: String)
    case fetchApplicationDetail(applicationId: String)
    case registrationResult(applicationId: String, result: ApplicationResultType)
}

extension API: TargetType {
    var baseURL: URL { URL(string: "http://43.201.51.10:3000")! }

    var path: String {
        switch self {
        case .login:
            return "/user/login"
        case .signup:
            return "/user"
        case .registrationCompany, .fetchCompany:
            return "/company"
        case .fetchCompanyDetail(let companyId):
            return "/company/\(companyId)"
        case .searchCompany:
            return "/company/search"
        case .registrationJobOffer(let companyId, _):
            return "/job-offer?company=\(companyId)"
        case .editJobOffer(let jobOfferId, _), .deleteJobOffer(let jobOfferId),
                .fetchJobOfferDetail(let jobOfferId):
            return "/job-offer/\(jobOfferId)"
        case .fetchJobOffer:
            return "/job-offer"
        case .fetchJobOfferByCompany(let companyId):
            return "/job-offer/company/\(companyId)"
        case .fetchApplicationList(let jobOfferId):
            return "/\(jobOfferId)/admin"
        case .fetchApplicationDetail(let applicationId), .registrationResult(let applicationId, _):
            return "/application/\(applicationId)/admin"
        }
    }

    var method: Moya.Method {
        switch self {
        case .login, .signup, .registrationCompany, .searchCompany,
                .registrationJobOffer, .editJobOffer, .registrationResult:
            return .post
        case .deleteJobOffer:
            return .delete
        default:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .login(let phoneNumber, let password):
            return .requestParameters(
                parameters: [
                    "phone": phoneNumber,
                    "password": password
                ],
                encoding: JSONEncoding.default
            )
        case .signup(let phoneNumber, let password, let name):
            return .requestParameters(
                parameters: [
                    "phone": phoneNumber,
                    "password": password,
                    "name": name,
                    "host": true
                ],
                encoding: JSONEncoding.default
            )
        case .searchCompany(let word):
            return .requestParameters(
                parameters: [
                    "word": word
                ],
                encoding: URLEncoding.default
            )
        case .registrationJobOffer(_, let request), .editJobOffer(_, let request):
            return .requestJSONEncodable(request)
        case .registrationResult(_, let result):
            return .requestParameters(
                parameters: [
                    "result": result.rawValue
                ],
                encoding: JSONEncoding.default
            )
        default:
            return .requestPlain
        }
    }

    var validationType: ValidationType {
        return .successCodes
    }

    var headers: [String: String]? {
        let token = LocalDataSourceImpl().fetchAccessToken()
        switch self {
        case .login, .signup:
            return nil
        default:
            return ["Authorization": "Bearer \(token)"]
        }
    }

}
