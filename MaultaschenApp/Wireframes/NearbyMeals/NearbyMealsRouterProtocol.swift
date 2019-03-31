//
//  NearbyMealsRouterProtocol.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import MaultaschenData

//sourcery: AutoMockable
protocol NearbyMealsRouterProtocol: AnyObject {
    func showDetails(for meal: Meal)
}
