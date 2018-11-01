//
//  CollectionExtensionsTests.swift
//  VOKUtilities
//
//  Copyright © 2018 Vokal. All rights reserved.
//

import XCTest

import VOKUtilities

class CollectionExtensionsTests: XCTestCase {
    func testSafeSubscript() {
        let nums: [Int] = [0, 1, 2]
        
        XCTAssertNotNil(nums[safe: nums.startIndex])
        XCTAssertNil(nums[safe: nums.endIndex])
    }
    
    private struct Person: Equatable {
        let name: String
        
        static let maryName = "Mary"
        static let johnName = "John"
        
        static let mary = Person(name: maryName)
        static let john = Person(name: johnName)
    }
    
    func testKeyPathMap() {
        let expectedNames = [Person.maryName, Person.johnName]
        
        let people = [Person.mary, Person.john]
        
        let actualNames = people.map(\.name)
        XCTAssertEqual(expectedNames, actualNames)
    }
    
    func testSortByKeyPath() {
        let expectedPeople = [Person.john, Person.mary]
        let unsortedPeople = [Person.mary, Person.john]
        let sortedPeople = unsortedPeople.sorted(by: \.name)
        
        XCTAssertEqual(expectedPeople, sortedPeople)
    }
}
