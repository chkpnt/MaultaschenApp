//
//  MealDetailsPresenterTests.swift
//  MaultaschenAppTests
//
//  Created by Gregor Dschung on 30.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import XCTest
import SwiftyMocky
import MaultaschenDomain
@testable import MaultaschenApp

class MealDetailsPresenterTests: XCTestCase {
    
    private var sut: MealDetailsPresenter!
    private var view: MealDetailsViewProtocolMock!
    private var interactor: MealDetailsInteractorProtocolMock!
    
    override func setUp() {
        super.setUp()
        interactor = MealDetailsInteractorProtocolMock()
        sut = MealDetailsPresenter(
            interactor: interactor
        )
        
        view = MealDetailsViewProtocolMock()
        sut.set(view: view)
    }
    
    func testShowMeal() {
        let meal = Meal(id: "123")
        meal.title = "Maultasche"
        meal.price = Decimal(string: "6.99")!
        
        sut.show(meal: meal)
        
        XCTAssertEqual(sut.mealTitleViewModel.text.value, "Maultasche")
        XCTAssertEqual(sut.mealPriceViewModel.text.value, "6.99 €")
        Verify(interactor, .loadImage(forMeal: .matching { $0 === meal }))
        Verify(view, .updateImage())
    }
    
    func testDidTapEditButton() {
        XCTAssertEqual(sut.mealTitleViewModel.mode.value, .view)
        XCTAssertEqual(sut.mealPriceViewModel.mode.value, .view)
        
        sut.didTapEditButton()
        
        XCTAssertEqual(sut.mealTitleViewModel.mode.value, .edit)
        XCTAssertEqual(sut.mealPriceViewModel.mode.value, .edit)
    }
    
    func testDidTapEditDoneButton() {
        let meal = Meal(id: "123")
        meal.title = "Maultasche"
        meal.price = Decimal(string: "6.99")!
        sut.show(meal: meal)
        sut.didTapEditButton()
        
        sut.mealTitleViewModel.text.value = "Sehr leckere Maultasche"
        sut.mealPriceViewModel.text.value = "7.98 €"
        sut.didTapEditDoneButton()
        
        XCTAssertEqual(meal.title, "Sehr leckere Maultasche")
        XCTAssertEqual(meal.price, Decimal(string: "7.98")!)
        Verify(interactor, .save(meal: .matching { $0 === meal }))
    }
    
}
