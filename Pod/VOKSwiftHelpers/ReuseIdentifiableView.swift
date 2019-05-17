//
//  ReuseIdentifiableView.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import UIKit

/// Mix-in protocol for cells and views that make use of a reuse identifier. The default implementation of
/// `defaultReuseIdentifier` returns the class name. Add this protocol to a class to use that default functionality.
/// For nibs, be sure to set the reuse identifier in Interface Builder to the class name.
public protocol ReuseIdentifiableView: UIView {
    var reuseIdentifier: String? { get }
    
    static var defaultReuseIdentifier: String { get }
}

// MARK: - ReuseIdentifiableView Conformances

extension ReuseIdentifiableView {
    public static var defaultReuseIdentifier: String {
        // Default implementation.
        return String(describing: self)
    }
}

/// Provide a default reuse identifier for table view cells.
extension UITableViewCell: ReuseIdentifiableView {
    // Mix-in
}

/// Provide a default reuse identifier for table view headers and footers.
extension UITableViewHeaderFooterView: ReuseIdentifiableView {
    // Mix-in
}

/// Provide a default reuse identifier for collection view cells.
extension UICollectionReusableView: ReuseIdentifiableView {
    // Mix-in
}
