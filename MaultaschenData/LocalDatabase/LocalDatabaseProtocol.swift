//
//  LocalDatabaseProtocol.swift
//  MaultaschenData
//
//  Created by Gregor Dschung on 11.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import CoreLocation
import MaultaschenDomain

//sourcery: AutoMockable
protocol LocalDatabaseProtocol {
    func findAllMeals() -> [Meal]
    func save(meal: Meal)
    
    func findAllVenues(near position: CLLocationCoordinate2D, maxDistance: CLLocationDistance) -> [Venue]
}
