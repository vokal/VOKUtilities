//
//  UITableViewExtensionsTests.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import XCTest
import VOKUtilities

class UITableViewExtensionsTests: XCTestCase {
    func testRegistersCell() {
        class TestCell: UITableViewCell {}
        
        let tableView = UITableView()
        let reuseIdentifier = TestCell.defaultReuseIdentifier
        
        var exampleCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? TestCell
        XCTAssertNil(exampleCell)
        
        tableView.register(TestCell.self)
        
        exampleCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? TestCell
        XCTAssertNotNil(exampleCell)
    }
    
    func testRegistersNibForCell() {
        let tableView = UITableView()
        let reuseIdentifier = ExampleTableViewCell.defaultReuseIdentifier
        
        var exampleCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? ExampleTableViewCell
        XCTAssertNil(exampleCell)
        
        tableView.registerNib(forCell: ExampleTableViewCell.self)
        
        exampleCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? ExampleTableViewCell
        XCTAssertNotNil(exampleCell)
    }
    
    func testRegistersHeaderFooterView() {
        class TestFooterView: UITableViewHeaderFooterView {}
        
        let tableView = UITableView()
        let reuseIdentifier = TestFooterView.defaultReuseIdentifier
        
        var exampleHeaderFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) as? TestFooterView
        XCTAssertNil(exampleHeaderFooterView)
        
        tableView.register(TestFooterView.self)
        
        exampleHeaderFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) as? TestFooterView
        XCTAssertNotNil(exampleHeaderFooterView)
    }
    
    func testRegistersNibForHeaderFooterView() {
        let tableView = UITableView()
        let reuseIdentifier = ExampleHeaderFooterView.defaultReuseIdentifier
        
        var exampleHeaderFooter = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) as? ExampleHeaderFooterView
        XCTAssertNil(exampleHeaderFooter)
        
        tableView.registerNib(forHeaderFooterView: ExampleHeaderFooterView.self)
        
        exampleHeaderFooter = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) as? ExampleHeaderFooterView
        XCTAssertNotNil(exampleHeaderFooter)
    }
}
