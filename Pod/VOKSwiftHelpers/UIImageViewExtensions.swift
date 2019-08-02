//
//  UIImageViewExtensions.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import UIKit

public extension UIImageView {
    /// Applies a desired tint color to the image view.
    ///
    /// - Parameter newTintColor: the tint color to apply on the image view.
    func applyTintColor(_ newTintColor: UIColor?) {
        let templateImage = image?.withRenderingMode(.alwaysTemplate)
        image = templateImage
        tintColor = newTintColor
    }
}
