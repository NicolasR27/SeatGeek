
import Foundation
import Alamofire

protocol SessionManager{
    func request(_ request: URLRequestConvertible, completionHandler: @escaping (AFDataResponse<Data>) -> Void)
}

extension Session: SessionManager {
    func request(_ request: URLRequestConvertible, completionHandler: @escaping (AFDataResponse<Data>) -> Void) {
        self.request(request).responseData(completionHandler: completionHandler)
    }
}
