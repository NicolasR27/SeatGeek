//
//  HTTPError.swift
//  SeatGeek
//
//  Created by Nicolas Rios on 5/4/22.
//

import Foundation
import Foundation

enum NetWorkError: Error, Equatable {
    case statusCode(Int)
    case emptyResponse
}
