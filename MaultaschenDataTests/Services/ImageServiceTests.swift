//
//  ImageRepositoryTests.swift
//  MaultaschenDataTests
//
//  Created by Gregor Dschung on 17.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import XCTest
import SwiftyMocky
import MaultaschenDomain
@testable import MaultaschenData

class ImageServiceTests: XCTestCase {
    
    private var sut: ImageService!
    
    override func setUp() {
        super.setUp()
        sut = ImageService()
    }
    
    func testGetImageForStaticMeals() {
        assertImageRepositoryReturnsImage(forMealId: "6792282444_f100e81868_o")
        assertImageRepositoryReturnsImage(forMealId: "25385620682_4ffcfc301e_o")
        assertImageRepositoryReturnsImage(forMealId: "24652084979_33cf407520_o")
    }
    
    func testGetImageReturnsPlaceholderImage() {
        let meal = Meal(id: "without-image")
        
        let image = sut.getImage(for: meal)
        
        XCTAssertEqual(image, R.image.questionmark()!)
    }
    
    private func assertImageRepositoryReturnsImage(forMealId id: String, line: UInt = #line) {
        let meal = Meal(id: id)
        
        let image = sut.getImage(for: meal)
        
        XCTAssert(image.size.width > 100)
        XCTAssertNotEqual(image, R.image.questionmark())
    }
   
    
}
