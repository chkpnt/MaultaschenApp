//
//  NearbyMealsWireframeTests.swift
//  MaultaschenAppTests
//
//  Created by Gregor Dschung on 30.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import XCTest
import SwiftyMocky
@testable import MaultaschenApp
@testable import MaultaschenData

class NearbyMealsWireframeTests: XCTestCase {
    
    private var sut: NearbyMealsWireframe!
    private var presenter: NearbyMealsPresenterProtocolMock!
    
    override func setUp() {
        super.setUp()
        presenter = NearbyMealsPresenterProtocolMock()
        sut = NearbyMealsWireframe(viewController: UIViewController(), presenter: presenter)
    }
    
    func testFilterMeals() {
        sut.filterMeals(by: "Maultasche")
        
        Verify(presenter, .filterMeals(by: .value("Maultasche")))
    }
    
    func testConfigureTabBarItem() {
        let tabBarItem = UITabBarItem()
        
        sut.configure(tabBarItem: tabBarItem)
        
        XCTAssertEqual(tabBarItem.title, "Meals!")
        XCTAssertEqual(tabBarItem.image, R.image.nearbyMealsTabBarIcon())
    }
}

