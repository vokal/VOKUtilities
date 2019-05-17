//
//  IntExtensionsTests.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import XCTest
import VOKUtilities

class IntExtensionsTests: XCTestCase {
    func testIncrementing() {
        var someInt: Int = 0
        
        someInt.increment()
        XCTAssertEqual(1, someInt)
        someInt.increment()
        XCTAssertEqual(2, someInt)
    }
    
    func testDecrementing() {
        var someInt: Int = 1
        
        someInt.decrement()
        XCTAssertEqual(0, someInt)
        someInt.decrement()
        XCTAssertEqual(-1, someInt)
    }
}
