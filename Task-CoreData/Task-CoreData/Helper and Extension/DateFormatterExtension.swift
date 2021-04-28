//
//  DateFormatterExtension.swift
//  Task-CoreData
//
//  Created by Jaymond Richardson on 4/27/21.
//

import Foundation

extension DateFormatter {
    
    static let medicationTime: DateFormatter = {
       
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
        
    }()
    
}
extension Date {
    
    func formatToString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        return formatter.string(from: self)
    }
}
