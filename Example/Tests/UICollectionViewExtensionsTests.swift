//
//  UICollectionViewExtensionsTests.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import XCTest
import VOKUtilities

class UICollectionViewExtensionsTests: XCTestCase {
    func testRegistersNibForCell() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        let dataSource = ExampleDataSource()
        collectionView.dataSource = dataSource
        
        collectionView.registerNib(forCell: ExampleCollectionViewCell.self)

        let reuseIdentifier = ExampleCollectionViewCell.defaultReuseIdentifier
        let indexPath = IndexPath(item: 0, section: 0)
        let exampleCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                             for: indexPath) as? ExampleCollectionViewCell
        XCTAssertNotNil(exampleCell)
    }
}

private class ExampleDataSource: NSObject, UICollectionViewDataSource {
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: ExampleCollectionViewCell.defaultReuseIdentifier,
                                                  for: indexPath)
    }
}
