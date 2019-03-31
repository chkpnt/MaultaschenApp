//
//  MealService.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import MaultaschenDomain

class MealService {
    
    private let db: LocalDatabaseProtocol
    
    init(db: LocalDatabaseProtocol) {
        self.db = db
    }
    
}

extension MealService: MealServiceProtocol {

    public func getAllMeals() -> [Meal] {
        return db.findAllMeals()
    }
    
    public func save(meal: Meal) {
        db.save(meal: meal)
    }
}
