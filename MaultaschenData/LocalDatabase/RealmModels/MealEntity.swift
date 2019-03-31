//
//  MealEntity.swift
//  MaultaschenData
//
//  Created by Gregor Dschung on 11.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import RealmSwift

final class MealEntity: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var mealDescription: String = ""
    @objc dynamic var price: Double = 0.0
    @objc dynamic var venue: VenueEntity?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
