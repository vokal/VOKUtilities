//
//  ReuseIdentifiable.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import UIKit

/// Mix-in protocol for cells and views that make use of a reuse identifier. The default implementation of
/// `defaultReuseIdentifier` returns the class name. Add this protocol to a class to use that default functionality.
/// For nibs, be sure to set the reuse identifier in Interface Builder to the class name.
public protocol ReuseIdentifiable: class {
    static var defaultReuseIdentifier: String { get }
}

/// A `ReuseIdentifiable` `UIView`.
public typealias ReuseIdentifiableView = ReuseIdentifiable & UIView

extension ReuseIdentifiable where Self: UIView {
    public static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

/// Provide a default reuse identifier for table view cells.
extension UITableViewCell: ReuseIdentifiable {
    // Mix-in
}

/// Provide a default reuse identifier for table view headers and footers.
extension UITableViewHeaderFooterView: ReuseIdentifiable {
    // Mix-in
}

/// Provide a default reuse identifier for collection view cells.
extension UICollectionReusableView: ReuseIdentifiable {
    // Mix-in
}
