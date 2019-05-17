//
//  StringExtensionsTests.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import XCTest
import VOKUtilities

class StringExtensionsTests: XCTestCase {
    func testRemovesNonDigits() {
        let initialString = "$111,222,333"
        let expectedString = "111222333"
        XCTAssertEqual(expectedString, initialString.digits)
    }
    
    func testIntValueOfString() {
        let intString = "111"
        XCTAssertEqual(111, intString.intValue)
        
        let nonIntString = "111.22"
        XCTAssertNil(nonIntString.intValue)
        
        XCTAssertNil("foo".intValue)
    }
    
    func testDoubleValueOfString() {
        let doubleString = "111.22"
        XCTAssertEqual(111.22, doubleString.doubleValue)
        
        let doubleString2 = "111"
        XCTAssertEqual(111.0, doubleString2.doubleValue)
        
        XCTAssertNil("foo".doubleValue)
    }
}
