//
//  UINibExtensions.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import UIKit

public extension UINib {
    /// Convenience initializer to get a nib from a `ReuseIdentifiableView` type.
    ///
    /// - Parameter viewType: the view type to initialize the nib with.
    convenience init<View: ReuseIdentifiableView>(viewType: View.Type) {
        self.init(nibName: viewType.defaultReuseIdentifier, bundle: Bundle(for: viewType))
    }
}
