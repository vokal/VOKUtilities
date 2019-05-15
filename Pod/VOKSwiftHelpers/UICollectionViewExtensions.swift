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
    /// - Parameter cellType: the cell type with nib to register with the table view.
    public func registerNib(forCell cellType: UICollectionViewCell.Type) {
        let identifier = cellType.defaultReuseIdentifier
        let nib = UINib(nibName: identifier, bundle: Bundle(for: cellType))
        register(nib, forCellWithReuseIdentifier: identifier)
    }
}
