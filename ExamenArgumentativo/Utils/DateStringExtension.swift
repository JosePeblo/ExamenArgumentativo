//
//  DateStringExtension.swift
//  ExamenArgumentativo
//
//  Created by peblo on 23/11/23.
//

import Foundation

extension String {
    func toISODate(_ timeZone: TimeZone = TimeZone.current) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        guard let formatted = formatter.date(from: self) else {
            debugPrint("\nERROR decoding string to date")
            return Date()
        }
        
        return formatted
    }
}

extension Date {
    func toString(_ formatter: DateFormatter = DateFormatter()) -> String {
        return formatter.string(from: self)
    }
}
