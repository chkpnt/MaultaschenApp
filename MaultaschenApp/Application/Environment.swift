//
//  Environment.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import Swinject
import os.log
import MaultaschenDomain

class Environment {
    
    public static let instance = Environment()
    
    private let assembler: Assembler

    private init() {
        self.assembler = Assembler()
    }

    private var mainWireframe: MainWireframeProtocol?
    
    func setup() {
        applyAssemblies()
//        bootstrapLocalDatabase()
        
        mainWireframe = assembler.resolver.resolve(MainWireframeProtocol.self)!
        mainWireframe?.setAsRootView()
    }
    
    private func applyAssemblies() {
        // Domain
        assembler.apply(assembly: MaultaschenDomainAssembly())
        
        // Wireframes
        assembler.apply(assembly: MainAssembly())
//        assembler.apply(assembly: OverviewAssembly())
//        assembler.apply(assembly: SimpleFilterAssembly())
        assembler.apply(assembly: NearbyMealsAssembly())
//        assembler.apply(assembly: MealDetailsAssembly())
//        assembler.apply(assembly: NearbyVenuesAssembly())
//        assembler.apply(assembly: AboutAssembly())
        
        // Common Wireframes
//        assembler.apply(assembly: TextViewPopupAssembly())
        
        // Routing
        assembler.apply(assembly: RouterAssembly())
        
        // Data Access Layer
//        assembler.apply(assembly: MaultaschenDataAssembly())
        
        os_log(.debug, "Available through Swinject Container: %@", String(describing: assembler.resolver))
    }
    
//    private func bootstrapLocalDatabase() {
//        let mealRepository = assembler.resolver.resolve(MealRepositoryProtocol.self)!
//        mealRepository.bootstrap()
//    }
}
