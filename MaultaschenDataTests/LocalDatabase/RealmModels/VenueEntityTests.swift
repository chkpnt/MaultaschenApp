//
//  VenueEntityTests.swift
//  MaultaschenDataTests
//
//  Created by Gregor Dschung on 17.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import XCTest
@testable import MaultaschenData

class VenueEntityTests: XCTestCase {
    
    func testPrimaryKey() {
        let primaryKey = VenueEntity.primaryKey()
        XCTAssertEqual(primaryKey, "id")
    }
    
}
