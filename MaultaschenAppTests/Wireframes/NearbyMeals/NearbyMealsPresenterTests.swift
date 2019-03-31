//
//  NearbyMealsPresenterTests.swift
//  MaultaschenAppTests
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import XCTest
import SwiftyMocky
import MaultaschenDomain
@testable import MaultaschenApp

class NearbyMealsPresenterTests: XCTestCase {
    
    private var sut: NearbyMealsPresenter!
    private var view: NearbyMealsViewProtocolMock!
    private var interactor: NearbyMealsInteractorProtocolMock!
    private var router: NearbyMealsRouterProtocolMock!
    
    override func setUp() {
        super.setUp()
        interactor = NearbyMealsInteractorProtocolMock()
        router = NearbyMealsRouterProtocolMock()
        sut = NearbyMealsPresenter(
            interactor: interactor
        )
        sut.set(router: router)
        
        view = NearbyMealsViewProtocolMock()
        sut.set(view: view)
    }
    
    func testFindMeals() {
        let meal1 = Meal(id: "1"); meal1.title = "Maultasche"
        let meal2 = Meal(id: "2"); meal2.title = "Rührei"
        Given(interactor, .findMeals(willReturn: [
            (meal: meal1, image: UIImage()),
            (meal: meal2, image: UIImage())
        ]))
        var capturedViewCellModelsToShow: [MealCollectionViewCellModel]?
        Perform(view, .show(meals: .any, perform: { capturedViewCellModelsToShow = $0 }))
        
        sut.findMeals()
        
        XCTAssertEqual(capturedViewCellModelsToShow?.count, 2)
        XCTAssertTrue(capturedViewCellModelsToShow!.contains(where: { $0.title == "Maultasche" }))
        XCTAssertTrue(capturedViewCellModelsToShow!.contains(where: { $0.title == "Rührei" }))
    }
    
    func testFilter_CaseInsensitive() {
        testFindMeals()
        var capturedViewCellModelsToShow: [MealCollectionViewCellModel]?
        Perform(view, .show(meals: .any, perform: { capturedViewCellModelsToShow = $0 }))
        
        sut.filterMeals(by: "maul")
        
        XCTAssertEqual(capturedViewCellModelsToShow?.count, 1)
        XCTAssertTrue(capturedViewCellModelsToShow!.contains(where: { $0.title == "Maultasche" }))
    }
    
    func testFilter_EmptyFilterFiltersNothing() {
        testFindMeals()
        var capturedViewCellModelsToShow: [MealCollectionViewCellModel]?
        Perform(view, .show(meals: .any, perform: { capturedViewCellModelsToShow = $0 }))
        
        sut.filterMeals(by: "")
        
        XCTAssertEqual(capturedViewCellModelsToShow?.count, 2)
        XCTAssertTrue(capturedViewCellModelsToShow!.contains(where: { $0.title == "Maultasche" }))
        XCTAssertTrue(capturedViewCellModelsToShow!.contains(where: { $0.title == "Rührei" }))
    }
    
    func testDidTapMeal() {
        let mealViewModel = MealCollectionViewCellModel(meal: Meal(id: "123"), image: nil)
        
        sut.didTap(meal: mealViewModel)
        
        Verify(router, .showDetails(for: .matching { $0.id == "123" }))
    }
    

}
