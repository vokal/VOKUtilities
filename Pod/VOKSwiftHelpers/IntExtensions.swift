//
//  IntExtensions.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import Foundation

extension Int {
    /// Increment self by 1.
    public mutating func increment() {
        self += 1
    }
    
    /// Decrement self by 1.
    public mutating func decrement() {
        self -= 1
    }
}
