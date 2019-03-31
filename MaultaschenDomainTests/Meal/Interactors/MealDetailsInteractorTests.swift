//
//  MealDetailsInteractorTests.swift
//  MaultaschenAppTests
//
//  Created by Gregor Dschung on 30.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import XCTest
import SwiftyMocky
@testable import MaultaschenDomain

class MealDetailsInteractorTests: XCTestCase {
    
    private var sut: MealDetailsInteractor!
    private var mealService: MealServiceProtocolMock!
    private var imageService: ImageServiceProtocolMock!
    private var delegate: MealDetailsInteractorDelegateMock!
    
    override func setUp() {
        super.setUp()
        mealService = MealServiceProtocolMock()
        imageService = ImageServiceProtocolMock()
        sut = MealDetailsInteractor(
            mealService: mealService,
            imageService: imageService
        )
        delegate = MealDetailsInteractorDelegateMock()
        sut.set(delegate: delegate)
    }
    
    func testTestLoadImage() {
        let meal = Meal(id: "m"); let expectedImage = UIImage()
        Given(imageService, .getImage(for: .any, willReturn: expectedImage))
        
        sut.loadImage(forMeal: meal)
        
        Verify(delegate, .didLoad(image: .matching { $0 === expectedImage }, forMeal: .matching { $0 === meal }))
    }
    
    func testSave() {
        let meal = Meal(id: "m")
        
        sut.save(meal: meal)
        
        Verify(mealService, .save(meal: .matching { $0 === meal }))
    }
}
