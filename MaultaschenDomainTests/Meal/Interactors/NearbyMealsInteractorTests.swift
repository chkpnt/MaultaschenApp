//
//  NearbyMealsInteractorTests.swift
//  MaultaschenAppTests
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import XCTest
import SwiftyMocky
@testable import MaultaschenDomain

class NearbyMealsInteractorTests: XCTestCase {
    
    private var sut: NearbyMealsInteractor!
    private var mealService: MealServiceProtocolMock!
    private var imageService: ImageServiceProtocolMock!
    
    override func setUp() {
        super.setUp()
        mealService = MealServiceProtocolMock()
        imageService = ImageServiceProtocolMock()
        sut = NearbyMealsInteractor(
            mealService: mealService,
            imageService: imageService
        )
    }
    
    func testFindMeals() {
        let meal1 = Meal(id: "m1"); let image1 = UIImage()
        let meal2 = Meal(id: "m2"); let image2 = UIImage()
        Given(mealService, .getAllMeals(willReturn: [meal1, meal2]))
        Given(imageService, .getImage(for: .matching({ $0 === meal1}), willReturn: image1))
        Given(imageService, .getImage(for: .matching({ $0 === meal2}), willReturn: image2))
        
        let meals = sut.findMeals()
        
        XCTAssertEqual(meals.count, 2)
        XCTAssertTrue(meals[0].meal === meal1)
        XCTAssertTrue(meals[0].image === image1)
        XCTAssertTrue(meals[1].meal === meal2)
        XCTAssertTrue(meals[1].image === image2)
    }
}
