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
    func viewDidLoad()
    func findMeals()
    func didTap(meal: MealCollectionViewCellModel)
    func filterMeals(by name: String)
}

class NearbyMealsPresenter: NearbyMealsPresenterProtocol {
    
    private let interactor: NearbyMealsInteractorProtocol
    private weak var router: NearbyMealsRouterProtocol?
    private weak var view: NearbyMealsViewProtocol?
    
    private var currentViewModels: [MealCollectionViewCellModel] = []

    init(interactor: NearbyMealsInteractorProtocol) {
        self.interactor = interactor
    }
    
    func set(router: NearbyMealsRouterProtocol) {
        self.router = router
    }
    
    func set(view: NearbyMealsViewProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        findMeals()
    }
    
    func findMeals() {
        let meals = interactor.findMeals()
            .map { m in MealCollectionViewCellModel(meal: m.meal, image: m.image) }
        currentViewModels = meals
        view?.show(meals: meals)
    }
    
    func didTap(meal: MealCollectionViewCellModel) {
        router?.showDetails(for: meal.meal)
    }
    
    func filterMeals(by name: String) {
        guard !name.isEmpty else {
            view?.show(meals: currentViewModels)
            return
        }
        
        let filteredViewModels = currentViewModels.filter {
            $0.title.localizedCaseInsensitiveContains(name) || $0.venue.localizedCaseInsensitiveContains(name)
        }
        view?.show(meals: filteredViewModels)
    }
    
}
