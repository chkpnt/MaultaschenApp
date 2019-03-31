//
//  MealServiceTests.swift
//  MaultaschenDataTests
//
//  Created by Gregor Dschung on 17.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import XCTest
import SwiftyMocky
import MaultaschenDomain
@testable import MaultaschenData

class MealServiceTests: XCTestCase {
    
    private var sut: MealService!
    private var db: LocalDatabaseProtocolMock!
    
    override func setUp() {
        super.setUp()
        db = LocalDatabaseProtocolMock()
        sut = MealService(db: db)
    }
    
    func testGetAllMealsReturnsCorrectMealInstances() {
        let meal1 = Meal(id: "1")
        let meal2 = Meal(id: "2")
        Given(db, .findAllMeals(willReturn: [meal1, meal2]))
        
        let meals = sut.getAllMeals()
        
        XCTAssert(meals[0] === meal1)
        XCTAssert(meals[1] === meal2)
    }
    
    func testSaveMeal() {
        let meal = Meal(id: "1")
        
        sut.save(meal: meal)
        
        Verify(db, .save(meal: .matching { $0 === meal } ))
    }
    
}
