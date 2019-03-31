//
//  RealmDatabase.swift
//  MaultaschenData
//
//  Created by Gregor Dschung on 11.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import os.log
import Foundation
import RealmSwift
import CoreLocation
import MaultaschenDomain

class RealmDatabase {
    
    private let realm: Realm
    private let mealEntityMapper: MealEntityMapperProtocol
    private let venueEntityMapper: VenueEntityMapperProtocol
    
    init(mealEntityMapper: MealEntityMapperProtocol,
         venueEntityMapper: VenueEntityMapperProtocol) {
        self.mealEntityMapper = mealEntityMapper
        self.venueEntityMapper = venueEntityMapper
        
        let config = Realm.Configuration(
            schemaVersion: 1,
            deleteRealmIfMigrationNeeded: true
        )
        Realm.Configuration.defaultConfiguration = config
        
        realm = try! Realm()
        os_log(.debug, "Using realm database: %@", String(describing: realm.configuration.fileURL?.absoluteString))
    }
}

extension RealmDatabase: LocalDatabaseProtocol {
    
    func findAllMeals() -> [Meal] {
        let meals: [Meal] = realm
            .objects(MealEntity.self)
            .map(mealEntityMapper.map)
        return meals
    }
    
    func findAllVenues(near position: CLLocationCoordinate2D, maxDistance: CLLocationDistance) -> [Venue] {
        let venues: [Venue] = realm
            .objects(VenueEntity.self)
            .map(venueEntityMapper.map)
        return venues
    }
    
    
    func save(meal: Meal) {
        let entity = mealEntityMapper.map(meal: meal)
        try! realm.write {
            os_log(.debug, "Saving meal: %@", entity)
            realm.add(entity, update: true)
        }
    }
}

extension RealmDatabase: LocalDatabaseBootstrapProtocol {
    
    public func bootstrap() {
        os_log(.debug, "Bootstrapping Realm Database")
        try! realm.write {
            realm.deleteAll()
            realm.add(demoModels())
        }
    }
    
    private func demoModels() -> [Object] {
        let venue1 = VenueEntity()
        venue1.id = UUID().uuidString
        venue1.name = "Zur Teigtasche"
        
        let venue2 = VenueEntity()
        venue2.id = UUID().uuidString
        venue2.name = "Im goldenen Teigmantel"
        
        let meal1 = MealEntity()
        meal1.id = "6792282444_f100e81868_o"
        meal1.title = "Maultaschensalat"
        meal1.mealDescription = "Salat mit Maultaschen auf Teller"
        meal1.price = 8.99
        meal1.venue = venue1
        
        let meal2 = MealEntity()
        meal2.id = "25385620682_4ffcfc301e_o"
        meal2.title = "Maultaschen mit Speck"
        meal2.mealDescription = "Maultaschen mit Speck in Pfanne serviert"
        meal2.price = 7.99
        meal2.venue = venue2
        
        let meal3 = MealEntity()
        meal3.id = "24652084979_33cf407520_o"
        meal3.title = "Maultaschensuppe"
        meal3.mealDescription = "Maultaschensuppe mit Grünzeug in weißem Teller"
        meal3.price = 6.49
        meal3.venue = venue2
        
        let otherVenue1 = VenueEntity()
        otherVenue1.id = UUID().uuidString
        otherVenue1.name = "Maultaschenimbiss"
        
        let otherVenue2 = VenueEntity()
        otherVenue2.id = UUID().uuidString
        otherVenue2.name = "McMaultasche"
        
        return [meal1, meal2, meal3, otherVenue1, otherVenue2]
    }
}
