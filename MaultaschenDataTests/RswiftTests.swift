//
//  RswiftTests.swift
//  MaultaschenDataTests
//
//  Created by Gregor Dschung on 17.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import XCTest
@testable import MaultaschenData

class RswiftTests: XCTestCase {
    
    func testR() {
        do {
            try R.validate()
        } catch {
            XCTFail("Something is wrong with R.generated.swift: \(error)")
        }
    }
    
    func testImages() {
        XCTAssertNotNil(R.image._33cf407520_o())
        XCTAssertNotNil(R.image._4ffcfc301e_o())
        XCTAssertNotNil(R.image._f100e81868_o())
        XCTAssertNotNil(R.image.questionmark())
    }
    
}
