//
//  Extention+String.swift
//  macro
//
//  Created by Meichel Rendio on 28/11/21.
//

import Foundation

extension String {
    
    func toDate(with format: String = "yyyy-MM-dd") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        return date
    }
    
}

extension Date {

    func toString(withFormat format: String = "d MMM yyyy") -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)

        return str
    }
    
    func dateOnly() -> Date {
        let date = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: self)!
        return date
    }
}

