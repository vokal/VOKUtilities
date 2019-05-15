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
        class ExampleCell: UITableViewCell {}
        
        let tableView = UITableView()
        let reuseIdentifier = ExampleCell.defaultReuseIdentifier
        
        var exampleCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? ExampleCell
        XCTAssertNil(exampleCell)
        
        tableView.register(ExampleCell.self)
        
        exampleCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? ExampleCell
        XCTAssertNotNil(exampleCell)
    }
    
//    func testRegistersNibForCell() {
//        let tableView = UITableView()
//        
//        let reuseIdentifier = ExampleTableViewCell.defaultReuseIdentifier
//        var exampleCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? ExampleTableViewCell
//        XCTAssertNil(exampleCell)
//        
//        tableView.registerNib(forCell: ExampleTableViewCell.self)
//        exampleCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? ExampleTableViewCell
//        XCTAssertNotNil(exampleCell)
//    }
    
    func testRegistersHeaderFooterView() {
        class ExampleHeaderFooterView: UITableViewHeaderFooterView {}
        
        let tableView = UITableView()
        let reuseIdentifier = ExampleHeaderFooterView.defaultReuseIdentifier
        
        var exampleHeaderFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) as? ExampleHeaderFooterView
        XCTAssertNil(exampleHeaderFooterView)
        
        tableView.register(ExampleHeaderFooterView.self)
        
        exampleHeaderFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) as? ExampleHeaderFooterView
        XCTAssertNotNil(exampleHeaderFooterView)
    }
    
    func testRegistersNibForHeaderFooterView() {
        let tableView = UITableView()
        
//        let reuseIdentifier = ExampleTableViewCell.defaultReuseIdentifier
//        var exampleCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? ExampleTableViewCell
//        XCTAssertNil(exampleCell)
//
//        tableView.registerNib(forCell: ExampleTableViewCell.self)
//        exampleCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? ExampleTableViewCell
//        XCTAssertNotNil(exampleCell)
    }
}
