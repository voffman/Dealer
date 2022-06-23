//
//  NumberFormatter.swift
//  Dealer
//
//  Created by Владимир Свиридов on 14.04.2022.
//

import Foundation
// форматирует числа например: 1000 в 1 000
extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}
