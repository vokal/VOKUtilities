//
//  UICollectionViewExtensions.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import UIKit

extension UICollectionView {
    /// Convenience method to register a nib for a `ReuseIdentifiable` cell type for creating new cells.
    ///
    /// - Parameter cellType: the cell type with nib to register with the collection view.
    public func registerNib(forCell cellType: UICollectionViewCell.Type) {
        let nib = UINib(viewType: cellType)
        register(nib, forCellWithReuseIdentifier: cellType.defaultReuseIdentifier)
    }
}
