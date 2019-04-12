//
//  FindMaultaschenPresenter.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import MaultaschenDomain

//sourcery: AutoMockable
protocol NearbyMealsPresenterProtocol: AnyObject {
    func findMeals()
    func didTap(meal: MealCollectionViewCellModel)
    func filterMeals(by name: String)
}

class NearbyMealsPresenter: NearbyMealsPresenterProtocol {
    
    private let interactor: NearbyMealsInteractorProtocol
    private weak var router: NearbyMealsRouterProtocol?
    private weak var view: NearbyMealsViewProtocol?
    
    private var currentViewModels: [MealCollectionViewCellModel] = []
    private var currentActiveFilter: String = ""

    init(interactor: NearbyMealsInteractorProtocol) {
        self.interactor = interactor
    }
    
    func set(router: NearbyMealsRouterProtocol) {
        self.router = router
    }
    
    func set(view: NearbyMealsViewProtocol) {
        self.view = view
    }
    
    func findMeals() {
        interactor.findMeals()
    }
    
    func didTap(meal: MealCollectionViewCellModel) {
        router?.showDetails(for: meal.meal)
    }
    
    func filterMeals(by name: String) {
        currentActiveFilter = name
        updateView()
    }
    
    private func updateView() {
        guard !currentActiveFilter.isEmpty else {
            view?.show(meals: currentViewModels)
            return
        }
        
        let filteredViewModels = currentViewModels.filter {
            $0.title.localizedCaseInsensitiveContains(currentActiveFilter) || $0.venue.localizedCaseInsensitiveContains(currentActiveFilter)
        }
        view?.show(meals: filteredViewModels)
    }
    
}

extension NearbyMealsPresenter: NearbyMealsInteractorDelegate {
    
    func didFind(_ data: [(meal: Meal, image: UIImage)]) {
        currentViewModels = data.map { MealCollectionViewCellModel(meal: $0.meal, image: $0.image) }
        updateView()
    }
    
}
