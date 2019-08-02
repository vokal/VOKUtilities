//
//  UIStackViewExtensions.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import UIKit

public extension UIStackView {
    /// Remove an arranged subview from the stackview. This will call through the normal `UIStackView` method but will
    /// also call `removeFromSuperview` on the passed in view per the docs.
    ///
    /// - Parameter subview: the arranged subview to remove.
    func remove(arrangedSubview subview: UIView) {
        removeArrangedSubview(subview)
        subview.removeFromSuperview()
    }
    
    /// Remove all arranged subviews.
    func removeAllArrangedSubviews() {
        for arrangedSubview in arrangedSubviews {
            remove(arrangedSubview: arrangedSubview)
        }
    }
}
