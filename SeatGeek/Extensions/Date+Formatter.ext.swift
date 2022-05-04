//
//  Date+Formatter.swift
//  SeatGeek
//
//  Created by Nicolas Rios on 5/4/22.
//


import Foundation
extension Date {
    var formatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
}
