//
//  MealServiceProtocol.swift
//  MaultaschenDomain
//
//  Created by Gregor Dschung on 31.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
public protocol MealServiceProtocol {
    func getAllMeals() -> [Meal]
    func save(meal: Meal)
}
