//
//  UITableViewExtensions.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import UIKit

extension UITableView {
    /// Convenience method to register a nib for a `ReuseIdentifiable` cell type for creating new cells.
    ///
    /// - Parameter cellType: the cell type with nib to register with the table view.
    public func registerNib(forCell cellType: UITableViewCell.Type) {
        let nib = UINib(viewType: cellType)
        register(nib, forCellReuseIdentifier: cellType.defaultReuseIdentifier)
    }
    
    /// Convenience method to register a `ReuseIdentifiable` cell type for creating new cells.
    ///
    /// - Parameter cellType: the cell type to register with the table view.
    public func register(_ cellType: UITableViewCell.Type) {
        register(cellType, forCellReuseIdentifier: cellType.defaultReuseIdentifier)
    }
    
    /// Convenience method to register a nib for a `ReuseIdentifiable` header footer view type for creating new views.
    ///
    /// - Parameter cellType: the cell type with nib to register with the table view.
    public func registerNib(forHeaderFooterView headerFooterViewType: UITableViewHeaderFooterView.Type) {
        let nib = UINib(viewType: headerFooterViewType)
        register(nib, forHeaderFooterViewReuseIdentifier: headerFooterViewType.defaultReuseIdentifier)
    }
    
    /// Convenience method to register a `ReuseIdentifiable` header footer view type for creating new views.
    ///
    /// - Parameter headerFooterViewType: the header footer view type to register with the table view.
    public func register(_ headerFooterViewType: UITableViewHeaderFooterView.Type) {
        register(headerFooterViewType, forHeaderFooterViewReuseIdentifier: headerFooterViewType.defaultReuseIdentifier)
    }
}
