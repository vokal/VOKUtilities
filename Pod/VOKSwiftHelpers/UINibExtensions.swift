//
//  UINibExtensions.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import UIKit

extension UINib {
    /// Convenience initializer to get a nib from a `ReuseIdentifiable` view type.
    ///
    /// - Parameter viewType: the view type to initialize the nib with.
    public convenience init(viewType: ReuseIdentifiable.Type) {
        self.init(nibName: viewType.defaultReuseIdentifier, bundle: Bundle(for: viewType))
    }
}
