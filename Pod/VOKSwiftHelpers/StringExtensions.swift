//
//  StringExtensions.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import Foundation

public extension String {
    /// Get a new string by removing non-digits.
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
    /// Get the double value of a string. Will return nil if it can't convert.
    var doubleValue: Double? {
        return Double(self)
    }
    
    /// Get the int value of a string. Will return nil if it can't convert.
    var intValue: Int? {
        return Int(self)
    }
}
