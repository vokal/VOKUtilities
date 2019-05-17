//
//  UITableViewExtensionsTests.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import XCTest
import VOKUtilities

class UITableViewExtensionsTests: XCTestCase {
    private var tableView = UITableView()
    
    override func setUp() {
        super.setUp()
        
        tableView = UITableView()
    }
    
    func testRegistersCell() {
        class TestCell: UITableViewCell {}
        
        let cellType = TestCell.self
        tableView.register(cellType)
        assertDequeuesCell(cellType)
    }
    
    func testRegistersNibForCell() {
        let cellType = ExampleTableViewCell.self
        tableView.registerNib(forCell: cellType)
        assertDequeuesCell(cellType)
    }
    
    func testRegistersHeaderFooterView() {
        class TestFooterView: UITableViewHeaderFooterView {}
        
        let viewType = TestFooterView.self
        tableView.register(viewType)
        assertDequeuesHeaderFooterView(viewType)
    }
    
    func testRegistersNibForHeaderFooterView() {
        let viewType = ExampleHeaderFooterView.self
        tableView.registerNib(forHeaderFooterView: viewType)
        assertDequeuesHeaderFooterView(viewType)
    }
}

private extension UITableViewExtensionsTests {
    func assertDequeuesCell<Cell: ReuseIdentifiableView>(_ cellType: Cell.Type,
                                                         file: StaticString = #file,
                                                         line: UInt = #line) {
        let exampleCell = tableView.dequeueReusableCell(withIdentifier: cellType.defaultReuseIdentifier) as? Cell
        XCTAssertNotNil(exampleCell, file: file, line: line)
    }
    
    func assertDequeuesHeaderFooterView<View: ReuseIdentifiableView>(_ viewType: View.Type,
                                                                     file: StaticString = #file,
                                                                     line: UInt = #line) {
        let exampleView = tableView.dequeueReusableHeaderFooterView(withIdentifier: viewType.defaultReuseIdentifier) as? View
        XCTAssertNotNil(exampleView, file: file, line: line)
    }
}
