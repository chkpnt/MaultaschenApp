//
//  MealDetailsInteractor.swift
//  Meals
//
//  Created by Gregor Dschung on 13.01.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import MaultaschenData

//sourcery: AutoMockable
protocol MealDetailsInteractorProtocol: AnyObject {
    func loadImage(forMeal: Meal)
    func save(meal: Meal)

}

//sourcery: AutoMockable
protocol MealDetailsInteractorDelegate: AnyObject {
    func didLoad(image: UIImage, forMeal: Meal)
}

class MealDetailsInteractor: MealDetailsInteractorProtocol {
    
    private let mealRepository: MealRepositoryProtocol
    private let imageRepository: ImageRepositoryProtocol
    private weak var delegate: MealDetailsInteractorDelegate?
    
    init(mealRepository: MealRepositoryProtocol,
         imageRepository: ImageRepositoryProtocol) {
        self.mealRepository = mealRepository
        self.imageRepository = imageRepository
    }
    
    func set(delegate: MealDetailsInteractorDelegate) {
        self.delegate = delegate
    }
    
    func loadImage(forMeal meal: Meal) {
        let image = imageRepository.getImage(for: meal)
        delegate?.didLoad(image: image, forMeal: meal)
    }
    
    func save(meal: Meal) {
        mealRepository.save(meal: meal)
    }

}
