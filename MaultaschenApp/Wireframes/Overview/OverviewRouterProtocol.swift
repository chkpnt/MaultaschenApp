//
//  OverviewRouterProtocol.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 30.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import MaultaschenDomain

//sourcery: AutoMockable
protocol OverviewRouterProtocol: AnyObject {
    func showDetails(for meal: Meal)
}
