//
//  UIApplicationExtensions.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import UIKit

public extension UIApplication {
    /// Convenience method to dismiss the root view controller of the key window.
    ///
    /// This can be helpful if you have multiple presented view controllers stacked on top of each other.
    ///
    /// - Parameters:
    ///   - animated: whether to animate the dismissal or not. Default is `true`.
    ///   - completion: completion handler called after dismissal. Default is `nil`.
    static func dismissRootViewController(animated: Bool = true, completion: (() -> Void)? = nil) {
        shared.keyWindow?.rootViewController?.dismiss(animated: animated, completion: completion)
    }
}
