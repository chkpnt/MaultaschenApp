//
//  RswiftTests.swift
//  MaultaschenAppTests
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import XCTest
@testable import MaultaschenApp

class RswiftTests: XCTestCase {

    func testR() {
        do {
            try R.validate()
        } catch {
            XCTFail("Something is wrong with R.generated.swift: \(error)")
        }
    }
}
