//
//  MealCollectionViewCellModel.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit
import MaultaschenData

class MealCollectionViewCellModel {
    
    let meal: Meal
    let image: UIImage?
    
    var title: String { return meal.title }
    var venue: String { return meal.venue.name }
    var price: String { return meal.price.asGermanEuroString }
    
    init(meal: Meal, image: UIImage?) {
        self.meal = meal
        self.image = image
    }
}

private extension Decimal {
    
    var asGermanEuroString: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "de_DE")
        formatter.numberStyle = .currency
        return formatter.string(from: self as NSNumber) ?? "unkown"
    }
}
