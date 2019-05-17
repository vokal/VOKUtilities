//
//  UICollectionViewExtensionsTests.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import XCTest
import VOKUtilities

class UICollectionViewExtensionsTests: XCTestCase {
    private var collectionView: UICollectionView = .configuredForTesting
    
    override func setUp() {
        super.setUp()
        
        collectionView = .configuredForTesting
    }
    
    func testRegistersCell() {
        class TestCell: UICollectionViewCell {}
        
        let cellType = TestCell.self
        collectionView.register(cellType)
        assertRegistersCell(cellType)
    }
    
    func testRegistersNibForCell() {
        let cellType = ExampleCollectionViewCell.self
        collectionView.registerNib(forCell: cellType)
        assertRegistersCell(cellType)
    }
}

private extension UICollectionViewExtensionsTests {
    func assertRegistersCell<Cell: ReuseIdentifiableView>(_ cellType: Cell.Type,
                                                          file: StaticString = #file,
                                                          line: UInt = #line) {
        let exampleCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.defaultReuseIdentifier,
                                                             for: IndexPath(item: 0, section: 0)) as? Cell
        XCTAssertNotNil(exampleCell, file: file, line: line)
    }
}

private extension UICollectionView {
    static var configuredForTesting: UICollectionView {
        return UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    }
}
