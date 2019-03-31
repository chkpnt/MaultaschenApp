//
//  MealEntityTests.swift
//  MaultaschenDataTests
//
//  Created by Gregor Dschung on 11.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import XCTest
@testable import MaultaschenData

class MealEntityTests: XCTestCase {

    func testPrimaryKey() {
        let primaryKey = MealEntity.primaryKey()
        XCTAssertEqual(primaryKey, "id")
    }

}
