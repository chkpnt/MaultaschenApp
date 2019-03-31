//
//  MealDetailsPresenter.swift
//  Meals
//
//  Created by Gregor Dschung on 13.01.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import os.log
import MaultaschenData

protocol MealDetailsPresenterProtocol: AnyObject {
    var mealTitleViewModel: TextTableViewCellModel { get }
    var mealPriceViewModel: TextTableViewCellModel { get }
    var mealImage: UIImage? { get }
    
    func show(meal: Meal)
    func didTapEditButton()
    func didTapEditDoneButton()
}

class MealDetailsPresenter: MealDetailsPresenterProtocol {
    
    private let interactor: MealDetailsInteractorProtocol
    private weak var router: MealDetailsRouterProtocol?
    private weak var view: MealDetailsViewProtocol?

    lazy var mealTitleViewModel = TextTableViewCellModel()
    lazy var mealPriceViewModel = TextTableViewCellModel()
    
    private var meal: Meal? {
        didSet {
            mealTitleViewModel.text.value = meal?.title ?? ""
            mealPriceViewModel.text.value = "\(meal?.price ??? "-") €"
        }
    }
    
    var mealImage: UIImage? {
        didSet {
            view?.updateImage()
        }
    }
    
    deinit {
        os_log(.debug, "deinit %@", String(describing: self))
    }
    
    init(interactor: MealDetailsInteractorProtocol) {
        self.interactor = interactor
    }
    
    func set(view: MealDetailsViewProtocol) {
        self.view = view
    }
    
    func set(router: MealDetailsRouterProtocol) {
        self.router = router
    }
    
    func show(meal: Meal) {
        self.meal = meal
        interactor.loadImage(forMeal: meal)
        view?.updateImage()
    }
    
    func didTapEditButton() {
        switchToEditMode()
    }
    
    func didTapEditDoneButton() {
        // not implemented: validation through interactor
        switchToViewMode()
        updateMealModel()
    }
    
    private func updateMealModel() {
        guard let meal = meal else { return }
        
        meal.title = mealTitleViewModel.text.value
        if let price = Decimal(string: mealPriceViewModel.text.value) {
            meal.price = price
        }
        
        interactor.save(meal: meal)
    }
    
    private func switchToEditMode() {
        mealTitleViewModel.mode.value = .edit
        mealPriceViewModel.mode.value = .edit
    }
    
    private func switchToViewMode() {
        mealTitleViewModel.mode.value = .view
        mealPriceViewModel.mode.value = .view
    }
}

extension MealDetailsPresenter: MealDetailsInteractorDelegate {
    
    func didLoad(image: UIImage, forMeal meal: Meal) {
        self.mealImage = image
    }
}

infix operator ???: NilCoalescingPrecedence

private func ??? <T> (optional: T?, defaultValue: @autoclosure () -> String) -> String {
    guard let value = optional else {
        return defaultValue()
    }
    
    return String(describing: value)
}
