//
//  UITableViewExtensions.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import UIKit

public extension UITableView {
    /// Convenience method to register a nib for a `ReuseIdentifiableView` cell type for creating new cells.
    ///
    /// - Parameter cellType: the cell type with nib to register with the table view.
    func registerNib(forCell cellType: UITableViewCell.Type) {
        let nib = UINib(viewType: cellType)
        register(nib, forCellReuseIdentifier: cellType.defaultReuseIdentifier)
    }
    
    /// Convenience method to register a `ReuseIdentifiableView` cell type for creating new cells.
    ///
    /// - Parameter cellType: the cell type to register with the table view.
    func register(_ cellType: UITableViewCell.Type) {
        register(cellType, forCellReuseIdentifier: cellType.defaultReuseIdentifier)
    }
    
    /// Convenience method to register a nib for a `ReuseIdentifiableView` header footer view type for creating new views.
    ///
    /// - Parameter headerFooterViewType: the header footer view type with nib to register with the table view.
    func registerNib(forHeaderFooterView headerFooterViewType: UITableViewHeaderFooterView.Type) {
        let nib = UINib(viewType: headerFooterViewType)
        register(nib, forHeaderFooterViewReuseIdentifier: headerFooterViewType.defaultReuseIdentifier)
    }
    
    /// Convenience method to register a `ReuseIdentifiableView` header footer view type for creating new views.
    ///
    /// - Parameter headerFooterViewType: the header footer view type to register with the table view.
    func register(_ headerFooterViewType: UITableViewHeaderFooterView.Type) {
        register(headerFooterViewType, forHeaderFooterViewReuseIdentifier: headerFooterViewType.defaultReuseIdentifier)
    }
}
