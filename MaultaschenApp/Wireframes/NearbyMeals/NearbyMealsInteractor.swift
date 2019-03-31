//
//  NearbyMealsInteractor.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit
import MaultaschenData

typealias MealWithImage = (meal: Meal, image: UIImage)

//sourcery: AutoMockable
protocol NearbyMealsInteractorProtocol: AnyObject {
    func findMeals() -> [MealWithImage]
}

class NearbyMealsInteractor: NearbyMealsInteractorProtocol {
    
    private let mealRepository: MealRepositoryProtocol
    private let imageRepository: ImageRepositoryProtocol
    
    init(mealRepository: MealRepositoryProtocol, imageRepository: ImageRepositoryProtocol) {
        self.mealRepository = mealRepository
        self.imageRepository = imageRepository
    }
    
    func findMeals() -> [MealWithImage] {
        let result = mealRepository.getAllMeals()
            .map { m in (m, imageRepository.getImage(for: m)) }
        return result
    }
}
