//
//  UIViewControllerExtensionsTests.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import XCTest
import VOKUtilities

class UIViewControllerExtensionsTests: XCTestCase {
    func testAddsChild() {
        let rootVC = UIViewController()
        let childVC = UIViewController()
        rootVC.addChildVC(childVC)
        
        XCTAssertTrue(rootVC.children.contains(childVC))
    }
    
    func testRemovesChild() {
        let rootVC = UIViewController()
        let childVC = UIViewController()
        rootVC.addChildVC(childVC)
        
        childVC.removeFromParentVC()
        
        XCTAssertFalse(rootVC.children.contains(childVC))
    }
    
    func testEmbedsInNavigationController() {
        let rootVC = UIViewController()
        let navVC = rootVC.embeddedInNav()
        
        XCTAssertEqual(navVC.viewControllers.first, rootVC)
    }
}
