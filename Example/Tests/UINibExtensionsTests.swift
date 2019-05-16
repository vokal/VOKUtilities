//
//  UINibExtensionsTests.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import XCTest
import VOKUtilities

class UINibExtensionsTests: XCTestCase {
    func testInitWithViewType() {
        assertInitNib(forViewType: ExampleTableViewCell.self)
        assertInitNib(forViewType: ExampleHeaderFooterView.self)
        assertInitNib(forViewType: ExampleCollectionViewCell.self)
    }
}

private extension UINibExtensionsTests {
    func assertInitNib<View: ReuseIdentifiable>(forViewType viewType: View.Type,
                                                file: StaticString = #file,
                                                line: UInt = #line) {
        let nib = UINib(viewType: viewType)
        let nibView = nib.instantiate(withOwner: nil).first as? View
        XCTAssertNotNil(nibView, file: file, line: line)
    }
}
