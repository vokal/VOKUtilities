//
//  UICollectionViewExtensions.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import UIKit

extension UICollectionView {
    /// Convenience method to register a nib for a `ReuseIdentifiableView` cell type for creating new cells.
    ///
    /// - Parameter cellType: the cell type with nib to register with the collection view.
    public func registerNib(forCell cellType: UICollectionViewCell.Type) {
        let nib = UINib(viewType: cellType)
        register(nib, forCellWithReuseIdentifier: cellType.defaultReuseIdentifier)
    }
    
    /// Convenience method to register a `ReuseIdentifiableView` cell type for creating new cells.
    ///
    /// - Parameter cellType: the cell type to register with the collection view.
    public func register(_ cellType: UICollectionViewCell.Type) {
        register(cellType, forCellWithReuseIdentifier: cellType.defaultReuseIdentifier)
    }
}
