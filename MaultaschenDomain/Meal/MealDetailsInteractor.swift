//
//  MealDetailsInteractor.swift
//  Meals
//
//  Created by Gregor Dschung on 13.01.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
public protocol MealDetailsInteractorProtocol: AnyObject {
    func loadImage(forMeal: Meal)
    func save(meal: Meal)

    func set(delegate: MealDetailsInteractorDelegate)
}

//sourcery: AutoMockable
public protocol MealDetailsInteractorDelegate: AnyObject {
    func didLoad(image: UIImage, forMeal: Meal)
}

class MealDetailsInteractor: MealDetailsInteractorProtocol {
    
    private let mealService: MealServiceProtocol
    private let imageService: ImageServiceProtocol
    private weak var delegate: MealDetailsInteractorDelegate?
    
    init(mealService: MealServiceProtocol,
         imageService: ImageServiceProtocol) {
        self.mealService = mealService
        self.imageService = imageService
    }
    
    func set(delegate: MealDetailsInteractorDelegate) {
        self.delegate = delegate
    }
    
    func loadImage(forMeal meal: Meal) {
        let image = imageService.getImage(for: meal)
        delegate?.didLoad(image: image, forMeal: meal)
    }
    
    func save(meal: Meal) {
        mealService.save(meal: meal)
    }

}
