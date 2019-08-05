//
//  UIPageControlExtensions.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import UIKit

public extension UIPageControl {
    /// Refresh the current page of the page control.
    ///
    /// - Parameters:
    ///   - scrollView: the scroll view to use for calculating the current page.
    ///   - enclosingView: the scroll view's enclosing view (typically a view controller's main view or a table view
    ///     cell) to use for calculating the current page.
    func refreshCurrentPage(withScrollView scrollView: UIScrollView, enclosingView: UIView) {
        let pageIndex = round(scrollView.contentOffset.x / enclosingView.frame.width)
        currentPage = Int(pageIndex)
    }
}
