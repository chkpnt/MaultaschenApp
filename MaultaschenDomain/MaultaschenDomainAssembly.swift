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
//        let internalResolver = assembleInternals(parent: container)
        
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
    
//    private func assembleInternals(parent: Container) -> Resolver {
//        let internalContainer = Container(parent: parent)
//
//        internalContainer.register(VenueEntityMapperProtocol.self) { _ in VenueEntityMapper() }
//        internalContainer.register(MealEntityMapperProtocol.self) { r in
//            let venueMapper = r.resolve(VenueEntityMapperProtocol.self)!
//            return MealEntityMapper(venueEntityMapper: venueMapper)
//        }
//        internalContainer.register(LocalDatabaseProtocol.self) { r in
//            let mealMapper = r.resolve(MealEntityMapperProtocol.self)!
//            let venueMapper = r.resolve(VenueEntityMapperProtocol.self)!
//            return RealmDatabase(mealEntityMapper: mealMapper, venueEntityMapper: venueMapper)
//        }
//
//        return internalContainer
//    }
    
}
