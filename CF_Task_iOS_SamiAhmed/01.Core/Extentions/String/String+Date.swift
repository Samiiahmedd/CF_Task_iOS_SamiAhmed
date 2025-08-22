//
//  ContentView.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 21/08/2025.
//

import Foundation

extension String {
    func toDate(format: String = "MM/dd/yyyy") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return .now
        }
    }
}
