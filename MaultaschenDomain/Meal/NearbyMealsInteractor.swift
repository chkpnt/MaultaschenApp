//
//  NearbyMealsInteractor.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit

//sourcery: AutoMockable
public protocol NearbyMealsInteractorProtocol: AnyObject {
    func findMeals() -> [(meal: Meal, image: UIImage)]
}

class NearbyMealsInteractor: NearbyMealsInteractorProtocol {
    
    private let mealService: MealServiceProtocol
    private let imageService: ImageServiceProtocol
    
    init(mealService: MealServiceProtocol, imageService: ImageServiceProtocol) {
        self.mealService = mealService
        self.imageService = imageService
    }
    
    func findMeals() -> [(meal: Meal, image: UIImage)] {
        let result = mealService.getAllMeals()
            .map { m in (m, imageService.getImage(for: m)) }
        return result
    }
}
