//
//  RouterAssembly.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 11.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import Swinject

class RouterAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(Router.self) { resolver in Router(serviceLocator: resolver) }
            .inObjectScope(.container)  // -> Singleton
//            .implements(OverviewRouterProtocol.self)
            .implements(NearbyMealsRouterProtocol.self)
//            .implements(MealDetailsRouterProtocol.self)
//            .implements(NearbyVenuesRouterProtocol.self)
//            .implements(AboutRouterProtocol.self)
//            .implements(TextViewPopupRouterProtocol.self)
    }
}
