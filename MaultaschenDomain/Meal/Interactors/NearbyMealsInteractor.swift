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
    func findMeals()
    func set(delegate: NearbyMealsInteractorDelegate)
}

//sourcery: AutoMockable
public protocol NearbyMealsInteractorDelegate: AnyObject {
    func didFind(_: [(meal: Meal, image: UIImage)])
}

class NearbyMealsInteractor: NearbyMealsInteractorProtocol {
    
    private let mealService: MealServiceProtocol
    private let imageService: ImageServiceProtocol
    private weak var delegate: NearbyMealsInteractorDelegate?
    
    init(mealService: MealServiceProtocol, imageService: ImageServiceProtocol) {
        self.mealService = mealService
        self.imageService = imageService
    }
    
    func set(delegate: NearbyMealsInteractorDelegate) {
        self.delegate = delegate
    }
    
    func findMeals() {
        // Of course this would be async in reality
        let result = mealService.getAllMeals()
            .map { m in (m, imageService.getImage(for: m)) }
        delegate?.didFind(result)
    }
}
