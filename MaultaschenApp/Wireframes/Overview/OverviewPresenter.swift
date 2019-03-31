//
//  OverviewPresenter.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 24.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import MaultaschenData

protocol OverviewPresenterProtocol: class {
    func viewDidLoad()
}

class OverviewPresenter: OverviewPresenterProtocol {
    
    private let filterWireframe: SimpleFilterWireframeProtocol
    private let nearbyVenuesWireframe: NearbyVenuesWireframeProtocol
    private let findMealsWireframe: NearbyMealsWireframeProtocol
    
    private weak var view: OverviewViewProtocol?
    private weak var router: OverviewRouterProtocol?

    init(filterWireframe: SimpleFilterWireframeProtocol,
         nearbyVenuesWireframe: NearbyVenuesWireframeProtocol,
         findMealsWireframe: NearbyMealsWireframeProtocol) {
        self.filterWireframe = filterWireframe
        self.nearbyVenuesWireframe = nearbyVenuesWireframe
        self.findMealsWireframe = findMealsWireframe
    }
    
    func set(view: OverviewViewProtocol) {
        self.view = view
    }
    
    func set(router: OverviewRouterProtocol) {
        self.router = router
    }
    
    func viewDidLoad() {
        view?.add(wireframe: filterWireframe, height: 50)
        view?.add(wireframe: nearbyVenuesWireframe, height: 250)
        view?.add(wireframe: findMealsWireframe, height: 800)
    }
    
}

extension OverviewPresenter: SimpleFilterRouterProtocol {
    
    func filter(by name: String) {
        nearbyVenuesWireframe.filterVenues(by: name)
        findMealsWireframe.filterMeals(by: name)
    }
    
    func didTapFilterButton() {
        
    }
    
}

extension OverviewPresenter: NearbyMealsRouterProtocol {
    
    func showDetails(for meal: Meal) {
        router?.showDetails(for: meal)
    }
    
}
