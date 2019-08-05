//
//  NSAttributedStringExtensionsTests.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import XCTest
import VOKUtilities

class NSAttributedStringExtensionsTests: XCTestCase {
    func testInitWithHTMLString() {
        let HTMLString = #"<p>Test test <a href="https://www.example.com/">Example</a></p>"#
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
        let attributedString = NSAttributedString(HTMLString: HTMLString, attributes: attributes)
        XCTAssertNotNil(attributedString)
    }
}
