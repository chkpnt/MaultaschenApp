//
//  MealEntityMapperTests.swift
//  MaultaschenDataTests
//
//  Created by Gregor Dschung on 17.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import XCTest
import SwiftyMocky
import MaultaschenDomain
@testable import MaultaschenData

class MealEntityMapperTests: XCTestCase {
    
    private var sut: MealEntityMapper!
    private var venueEntityMapper: VenueEntityMapperProtocolMock!
    
    override func setUp() {
        super.setUp()
        venueEntityMapper = VenueEntityMapperProtocolMock()
        sut = MealEntityMapper(venueEntityMapper: venueEntityMapper)
        
        Given(venueEntityMapper, .map(entity: .any, willReturn: Venue(id: "venueMock")))
        Given(venueEntityMapper, .map(venue: .any, willReturn: VenueEntity()))
    }
    
    func testMapMealToEntity() {
        let meal = Meal(id: "1234", venue: nil)
        meal.title = "Maultasche"
        meal.description = "Sehr leckere Maultasche"
        meal.price = Decimal(string: "4.99")!
        
        let entity = sut.map(meal: meal)
        
        XCTAssertEqual(entity.id, "1234")
        XCTAssertEqual(entity.title, "Maultasche")
        XCTAssertEqual(entity.mealDescription, "Sehr leckere Maultasche")
        XCTAssertEqual(entity.price, Double("4.99")!)
    }
    
    func testMapEntityToMeal() {
        let entity = MealEntity()
        entity.id = "1234"
        entity.title = "Maultasche"
        entity.mealDescription = "Sehr leckere Maultasche"
        entity.price = 4.99
        
        let meal = sut.map(entity: entity)

        XCTAssertEqual(meal.id, "1234")
        XCTAssertEqual(meal.title, "Maultasche")
        XCTAssertEqual(meal.description, "Sehr leckere Maultasche")
        XCTAssertEqual(meal.price, Decimal(string: "4.99")!)
    }
    
}
