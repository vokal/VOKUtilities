//
//  CollectionExtensions.swift
//  VOKUtilities
//
//  Copyright © 2018 Vokal. All rights reserved.
//

import Foundation

extension Array {
    /// Safely subscript into an array. This will perform a bounds check on the passed in index.
    ///
    /// - Parameter index: the index to look up in the array.
    /// - Returns: an element if the index is within bounds of the array; otherwise, nil.
    public subscript(safe index: Index) -> Element? {
        guard self.indices.contains(index) else { return nil }
        return self[index]
    }
}

extension Sequence {
    /// Map over a sequence using a KeyPath.
    /// https://www.swiftbysundell.com/posts/the-power-of-key-paths-in-swift
    ///
    /// - Parameter keyPath: the KeyPath to use for extracting values.
    /// - Returns: a new sequence with the values specified by the keypath.
    public func map<T>(_ keyPath: KeyPath<Element, T>) -> [T] {
        return map { $0[keyPath: keyPath] }
    }
    
    /// Sort a sequence by a KeyPath.
    /// https://www.swiftbysundell.com/posts/the-power-of-key-paths-in-swift
    ///
    /// - Parameter keyPath: the KeyPath to sort by.
    /// - Returns: a new sequence sorted by the specified KeyPath.
    public func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        return sorted { a, b in
            return a[keyPath: keyPath] < b[keyPath: keyPath]
        }
    }
}
