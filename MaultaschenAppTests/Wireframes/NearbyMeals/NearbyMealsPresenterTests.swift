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
        sut.findMeals()
        
        Verify(interactor, .findMeals())
    }
    
    func testDidFind() {
        let meal1 = Meal(id: "1"); meal1.title = "Maultasche"
        let meal2 = Meal(id: "2"); meal2.title = "Rührei"
        var capturedViewCellModelsToShow: [MealCollectionViewCellModel]?
        Perform(view, .show(meals: .any, perform: { capturedViewCellModelsToShow = $0 }))
        
        sut.didFind([
            (meal: meal1, image: UIImage()),
            (meal: meal2, image: UIImage())
        ])
        
        guard let viewModels = capturedViewCellModelsToShow else { return XCTFail("view.show(...) not called") }
        XCTAssertEqual(viewModels.count, 2)
        XCTAssertTrue(viewModels.contains(where: { $0.title == "Maultasche" }))
        XCTAssertTrue(viewModels.contains(where: { $0.title == "Rührei" }))
    }
    
    func testFilter_CaseInsensitive() {
        testDidFind()
        var capturedViewCellModelsToShow: [MealCollectionViewCellModel]?
        Perform(view, .show(meals: .any, perform: { capturedViewCellModelsToShow = $0 }))
        
        sut.filterMeals(by: "maul")
        
        guard let viewModels = capturedViewCellModelsToShow else { return XCTFail("view.show(...) not called") }
        XCTAssertEqual(viewModels.count, 1)
        XCTAssertTrue(viewModels.contains(where: { $0.title == "Maultasche" }))
    }
    
    func testFilter_EmptyFilterFiltersNothing() {
        testDidFind()
        var capturedViewCellModelsToShow: [MealCollectionViewCellModel]?
        Perform(view, .show(meals: .any, perform: { capturedViewCellModelsToShow = $0 }))
        
        sut.filterMeals(by: "")
        
        guard let viewModels = capturedViewCellModelsToShow else { return XCTFail("view.show(...) not called") }
        XCTAssertEqual(viewModels.count, 2)
        XCTAssertTrue(viewModels.contains(where: { $0.title == "Maultasche" }))
        XCTAssertTrue(viewModels.contains(where: { $0.title == "Rührei" }))
    }
    
    func testDidTapMeal() {
        let mealViewModel = MealCollectionViewCellModel(meal: Meal(id: "123"), image: nil)
        
        sut.didTap(meal: mealViewModel)
        
        Verify(router, .showDetails(for: .matching { $0.id == "123" }))
    }
    

}
