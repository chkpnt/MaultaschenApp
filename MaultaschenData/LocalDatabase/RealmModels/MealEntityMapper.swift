//
//  MealEntityMapper.swift
//  MaultaschenData
//
//  Created by Gregor Dschung on 17.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import MaultaschenDomain

//sourcery: AutoMockable
protocol MealEntityMapperProtocol {
    func map(entity: MealEntity) -> Meal
    func map(meal: Meal) -> MealEntity
}

class MealEntityMapper: MealEntityMapperProtocol {
    
    private let venueEntityMapper: VenueEntityMapperProtocol
    
    init(venueEntityMapper: VenueEntityMapperProtocol) {
        self.venueEntityMapper = venueEntityMapper
    }
    
    func map(entity: MealEntity) -> Meal {
        let meal = Meal(id: entity.id, venue: venue(of: entity))
        meal.title = entity.title
        meal.description = entity.mealDescription
        meal.price = Decimal(string: String(format: "%.2f", entity.price))!
        return meal
    }
    
    private func venue(of entity: MealEntity) -> Venue? {
        guard let venueEntity = entity.venue else { return nil }
        return venueEntityMapper.map(entity: venueEntity)
    }
    
    func map(meal: Meal) -> MealEntity {
        let entity = MealEntity()
        entity.id = meal.id
        entity.title = meal.title
        entity.mealDescription = meal.description
        entity.price = NSDecimalNumber(decimal: meal.price).doubleValue
        entity.venue = venueEntityMapper.map(venue: meal.venue)
        return entity
    }
    

}

