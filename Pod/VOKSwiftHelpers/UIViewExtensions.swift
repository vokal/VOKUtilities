//
//  UIViewExtensions.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import UIKit

extension UIView {
    /// Pin a view to the top/bottom/leading/trailing anchors of a given view.
    ///
    /// - Parameter pinningView: the view to pin to.
    public func pin(to pinningView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        pinningView.addSubview(self)
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: pinningView.topAnchor),
            bottomAnchor.constraint(equalTo: pinningView.bottomAnchor),
            leadingAnchor.constraint(equalTo: pinningView.leadingAnchor),
            trailingAnchor.constraint(equalTo: pinningView.trailingAnchor),
            ])
    }
    
    /// Convenience static member for a view with a clear background color.
    static var clear: UIView {
        let clearView = UIView()
        clearView.backgroundColor = .clear
        return clearView
    }
    
    /// Get the first superview with the given type.
    ///
    /// - Parameter type: The type of superview to search through.
    /// - Returns: The desired superview or nil if not found.
    public func firstSuperview<View: UIView>(of type: View.Type) -> View? {
        return superview as? View ?? superview.flatMap { $0.firstSuperview(of: type) }
    }
}
