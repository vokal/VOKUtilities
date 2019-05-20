//
//  UIViewExtensionsTests.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import XCTest
import VOKUtilities

class UIViewExtensionsTests: XCTestCase {
    private class SomeView: UIView {}
    private class SomeOtherView: UIView {}
    
    private let testViews: (first: SomeView, second: SomeOtherView, third: SomeOtherView) = (SomeView(),
                                                                                             SomeOtherView(),
                                                                                             SomeOtherView())
    
    func testFindsFirstSuperviewOfType() {
        let views = testViews
        views.second.addSubview(views.first)
        views.third.addSubview(views.second)
        
        let firstSuperview = views.first.firstSuperview(of: SomeOtherView.self)
        XCTAssertEqual(firstSuperview, views.second)
    }
    
    func testDoesNotFindFirstSuperviewOfType() {
        class UnknownView: UIView {}
        
        let views = testViews
        views.second.addSubview(views.first)
        views.third.addSubview(views.second)
        
        let firstSuperview = views.first.firstSuperview(of: UnknownView.self)
        XCTAssertNil(firstSuperview)
    }
}
