import Foundation

import Combine
import CombineMoya
import Moya

extension MoyaProvider {

    func requestPublisher<T: Decodable>(_ target: Target, _ model: T.Type) -> AnyPublisher<T, NetworkError> {
            return self.requestPublisher(target)
                .map(T.self)
                .map { return $0 }
                .mapError { NetworkError($0) }
                .eraseToAnyPublisher()
        }

    func requestVoidPublisher(_ target: Target) -> AnyPublisher<Void, NetworkError> {
        return self.requestPublisher(target)
            .map{ _ in return }
            .mapError { NetworkError($0) }
            .eraseToAnyPublisher()
    }

}
