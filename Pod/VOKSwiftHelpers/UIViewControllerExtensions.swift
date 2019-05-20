//
//  UIViewControllerExtensions.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import UIKit

extension UIViewController {
    /// Add a child view controller.
    ///
    /// - Parameter child: the child view controller to add.
    public func addChildVC(_ child: UIViewController) {
        child.beginAppearanceTransition(true, animated: false)
        addChild(child)
        child.view.pin(to: view)
        child.didMove(toParent: self)
        child.endAppearanceTransition()
    }
    
    /// Remove self from the parent view controller.
    public func removeFromParentVC() {
        guard parent != nil else { return }
        
        beginAppearanceTransition(false, animated: false)
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
        endAppearanceTransition()
    }
    
    /// Get self embedded in a navigation controller.
    ///
    /// Specify a navigation controller subclass at the callsite declaration if needed:
    ///
    ///     let navVC: SomeNavSubclass = someViewController.embeddedInNav()
    ///
    /// - Returns: a new navigation controller instance with self as the root view controller.
    public func embeddedInNav<NavigationController: UINavigationController>() -> NavigationController {
        return NavigationController(rootViewController: self)
    }
}
