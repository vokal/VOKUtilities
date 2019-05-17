//
//  TestExtensions.swift
//  VOKUtilities
//
//  Copyright © 2018 Vokal. All rights reserved.
//

import UIKit

extension UIViewController {
    /// Add the current view controller as the root view controller of the window.
    /// This method can be required for some situations (ex: view controller presentation tests, responder chain tests)
    /// when unit testing view controllers.
    public func makeRootForWindow() {
        UIApplication.shared.delegate?.window??.rootViewController = self
    }
    
    /// The view controller that will be transitioned to. You may need to call `makeRootForWindow()` before calling this.
    public var toViewController: UIViewController? {
        return transitionCoordinator?.viewController(forKey: .to)
    }
}

extension UIView {
    /// Add the current view as a subview of the window.
    /// This method can be required setup for some situations (ex: responder chain tests) when unit testing.
    public func addToWindow() {
        UIApplication.shared.delegate?.window??.addSubview(self)
    }
    
    /// Load a view from its associated nib. The nib must be the same name as the type itself. Declare the type name
    /// at the call site when declaring it (rather than using type inference).
    ///
    /// - Returns: an initialized view from the nib.
    public static func fromNib<T: UIView>() -> T {
        guard let nib = Bundle.main.loadNibNamed(String(describing: T.self),
                                                 owner: nil,
                                                 options: nil) else {
                                                    fatalError("We should have a nib.")
        }
        
        guard let firstViewFromNib = nib.first as? T else {
            fatalError("Something went wrong getting the view from the nib.")
        }
        
        return firstViewFromNib
    }
}

extension UIBarButtonItem {
    /// Programatically fire a bar button item action.
    public func fire() {
        guard let action = action else {
            assertionFailure("We tried to fire a nil bar button item action")
            return
        }
        
        UIApplication.shared.sendAction(action,
                                        to: target,
                                        from: nil,
                                        for: nil)
    }
}

extension UITableView {
    /// Programatically select a row for a unit test. This will also invoke the `didSelectRowAt` delegate method.
    public func selectRow(at indexPath: IndexPath) {
        selectRow(at: indexPath, animated: false, scrollPosition: .none)
        delegate?.tableView?(self, didSelectRowAt: indexPath)
    }
}
