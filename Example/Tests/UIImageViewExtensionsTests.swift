//
//  UIImageViewExtensionsTests.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import XCTest
import VOKUtilities

class UIImageViewExtensionsTests: XCTestCase {
    func testAppliesTintColor() {
        let imageView = UIImageView(image: UIImage())
        let expectedColor = UIColor.green
        
        XCTAssertNotEqual(expectedColor, imageView.tintColor)
        imageView.applyTintColor(expectedColor)
        XCTAssertEqual(expectedColor, imageView.tintColor)
        
        XCTAssertEqual(imageView.image?.renderingMode, .alwaysTemplate)
    }
}
