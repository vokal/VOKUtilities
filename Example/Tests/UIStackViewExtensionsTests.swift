//
//  UIStackViewExtensionsTests.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import XCTest
import VOKUtilities

class UIStackViewExtensionsTests: XCTestCase {
    private var stackView = UIStackView()
    
    override func setUp() {
        super.setUp()
        
        stackView = UIStackView()
    }
    
    func testRemovingArrangedSubview() {
        let aView = UIView()
        stackView.addArrangedSubview(aView)
        stackView.removeArrangedSubview(forView: aView)
        
        XCTAssertFalse(stackView.arrangedSubviews.contains(aView))
    }
    
    func testRemoveAllArrangedSubviews() {
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(UIView())
        stackView.removeAllArrangedSubviews()
        
        XCTAssertTrue(stackView.arrangedSubviews.isEmpty)
    }
}
