//
//  UIViewControllerExtensions.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import UIKit

public extension UIViewController {
    /// Add a child view controller.
    ///
    /// - Parameter child: the child view controller to add.
    /// - Parameter pinningView: the view to pin the child VC's view to. Default is nil which will pin to the parent
    ///   VC's main view.
    func addChildVC(_ child: UIViewController, pinningView: UIView? = nil) {
        child.beginAppearanceTransition(true, animated: false)
        addChild(child)
        child.view.pin(to: pinningView ?? view)
        child.didMove(toParent: self)
        child.endAppearanceTransition()
    }
    
    /// Remove self from the parent view controller.
    func removeFromParentVC() {
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
    func embeddedInNav<NavigationController: UINavigationController>() -> NavigationController {
        return NavigationController(rootViewController: self)
    }
}
