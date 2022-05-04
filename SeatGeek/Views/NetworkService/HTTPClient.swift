//
//  HTTPClient.swift
//  SeatGeek
//
//  Created by Nicolas Rios on 5/4/22.
//

import Foundation
import Alamofire

protocol HTTPClient_Protocol {
    // In The Real App (tm), we would use a promise as opposed to completion callbacks. However,
    //  promises can take a bit to wrap one's head around so use the more widely understood callbacks.
    func send(request: HTTPRequest, completion: @escaping (Result<Data, Error>) -> Void)
}

class HTTPClient: HTTPClient_Protocol {
    private let manager: SessionManager
    private let responseHandler: HTTPResponseHandler_Protocol
    
    init(manager: SessionManager = Session.default,
         responseHandler: HTTPResponseHandler_Protocol = HTTPResponseHandler()) {
        self.manager = manager
        self.responseHandler = responseHandler
    }
    
    func send(request: HTTPRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        manager.request(request) { dataResponse in
            let result = self.responseHandler.handle(dataResponse: dataResponse)
            completion(result)
        }
    }
}
