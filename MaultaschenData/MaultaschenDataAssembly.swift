//
//  MaultaschenDataAssembly.swift
//  MaultaschenData
//
//  Created by Gregor Dschung on 31.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import Swinject
import MaultaschenDomain

let maultaschenDataBundle = Bundle(for: MaultaschenDataAssembly.self)

public class MaultaschenDataAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        let internalResolver = assembleInternals(parent: container)
        
        container.register(LocalDatabaseBootstrapProtocol.self) { _ in
            return internalResolver.resolve(LocalDatabaseBootstrapProtocol.self)!
        }
        container.register(MealServiceProtocol.self) { _ in
            let localDb = internalResolver.resolve(LocalDatabaseProtocol.self)!
            return MealService(db: localDb)
        }
        container.register(VenueServiceProtocol.self) { _ in
            let localDb = internalResolver.resolve(LocalDatabaseProtocol.self)!
            return VenueService(db: localDb)
        }
        container.register(ImageServiceProtocol.self) { _ in
            return ImageService()
        }
    }
    
    private func assembleInternals(parent: Container) -> Resolver {
        let internalContainer = Container(parent: parent)
        
        internalContainer.register(VenueEntityMapperProtocol.self) { _ in VenueEntityMapper() }
        internalContainer.register(MealEntityMapperProtocol.self) { r in
            let venueMapper = r.resolve(VenueEntityMapperProtocol.self)!
            return MealEntityMapper(venueEntityMapper: venueMapper)
        }
        internalContainer.register(LocalDatabaseProtocol.self) { r in
            let mealMapper = r.resolve(MealEntityMapperProtocol.self)!
            let venueMapper = r.resolve(VenueEntityMapperProtocol.self)!
            return RealmDatabase(mealEntityMapper: mealMapper, venueEntityMapper: venueMapper)
        }.implements(LocalDatabaseBootstrapProtocol.self)
        
        return internalContainer
    }
    
}
