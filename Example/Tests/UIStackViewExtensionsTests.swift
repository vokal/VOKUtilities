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
        let subview = UIView()
        stackView.addArrangedSubview(subview)
        stackView.remove(arrangedSubview: subview)
        
        XCTAssertFalse(stackView.arrangedSubviews.contains(subview))
    }
    
    func testRemoveAllArrangedSubviews() {
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(UIView())
        stackView.removeAllArrangedSubviews()
        
        XCTAssertTrue(stackView.arrangedSubviews.isEmpty)
    }
}
