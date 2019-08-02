//
//  NSAttributedStringExtensions.swift
//  VOKUtilities
//
//  Copyright © 2019 Vokal. All rights reserved.
//

import UIKit

public extension NSAttributedString {
    /// Create a new attributed string from an HTML string.
    ///
    /// This will configure and style an attributed string with an HTML document type.
    /// - Parameter HTMLString: the attributed HTML String.
    /// - Parameter attributes: the attributes to apply to the string. Default is empty.
    convenience init?(HTMLString: String, attributes: [NSAttributedString.Key: Any] = [:]) {
        let options = [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html]
        
        guard
            // Need to use UTF-16 here as attributed strings apparently need data encoded that way.
            let HTMLStringData = HTMLString.data(using: .utf16),
            let attributedHTMLString = try? NSMutableAttributedString(data: HTMLStringData,
                                                                      options: options,
                                                                      documentAttributes: nil) else {
                                                                        print("There was an issue with the HTML string")
                                                                        return nil
        }
        
        if !attributes.isEmpty {
            let range = NSRange(location: 0, length: attributedHTMLString.length)
            attributedHTMLString.addAttributes(attributes, range: range)
        }
        
        self.init(attributedString: attributedHTMLString)
    }
}
