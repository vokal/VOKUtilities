//
//  UIViewExtensions.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import UIKit

public extension UIView {
    /// Pin a view to the top/bottom/leading/trailing anchors of a given view.
    ///
    /// - Parameter pinningView: the view to pin to.
    func pin(to pinningView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        pinningView.addSubview(self)
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: pinningView.topAnchor),
            bottomAnchor.constraint(equalTo: pinningView.bottomAnchor),
            leadingAnchor.constraint(equalTo: pinningView.leadingAnchor),
            trailingAnchor.constraint(equalTo: pinningView.trailingAnchor),
        ])
    }
    
    /// Center a view with another view.
    ///
    /// - Parameter centeringView: the view to center to.
    func center(to centeringView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centeringView.addSubview(self)
        
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: centeringView.centerXAnchor),
            centerYAnchor.constraint(equalTo: centeringView.centerYAnchor),
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
    func firstSuperview<View: UIView>(of type: View.Type) -> View? {
        return superview as? View ?? superview.flatMap { $0.firstSuperview(of: type) }
    }
}
