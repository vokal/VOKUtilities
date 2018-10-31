//
//  Result.swift
//  VOKUtilities
//
//  Copyright © 2018 Vokal. All rights reserved.
//

import Foundation

/// Generic completion closure for a Result.
typealias ResultCompletion<T> = (Result<T>) -> Void

/// An enum representing a success or failure.
///
/// - success: the success case with the associated value.
/// - failure: the failure case with the associated error.
enum Result<Value> {
    case success(Value)
    case failure(Error)
}
