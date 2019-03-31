//
//  MaultaschenDomainAssembly.swift
//  MaultaschenDomain
//
//  Created by Gregor Dschung on 31.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import Swinject

public class MaultaschenDomainAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.register(NearbyMealsInteractorProtocol.self) { r in
            return NearbyMealsInteractor(
                mealService: r.resolve(MealServiceProtocol.self)!,
                imageService: r.resolve(ImageServiceProtocol.self)!
            )
        }
        container.register(MealDetailsInteractorProtocol.self) { r in
            return MealDetailsInteractor(
                mealService: r.resolve(MealServiceProtocol.self)!,
                imageService: r.resolve(ImageServiceProtocol.self)!
            )
        }
        container.register(NearbyVenuesInteractorProtocol.self) { r in
            return NearbyVenuesInteractor(
                venueService: r.resolve(VenueServiceProtocol.self)!
            )
        }
        
    }
    
}
