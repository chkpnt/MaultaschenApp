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
import MaultaschenData

class Environment {
    
    public static let instance = Environment()
    
    private let assembler: Assembler

    private init() {
        self.assembler = Assembler(parentAssembler: nil, defaultObjectScope: .transient, behaviors: [])
    }

    private var mainWireframe: MainWireframeProtocol?
    
    func setup() {
        applyAssemblies()
        bootstrapLocalDatabase()
        
        mainWireframe = assembler.resolver.resolve(MainWireframeProtocol.self)!
        mainWireframe?.setAsRootView()
    }
    
    private func applyAssemblies() {
        // Domain
        assembler.apply(assembly: MaultaschenDomainAssembly())
        
        // Data
        assembler.apply(assembly: MaultaschenDataAssembly())
        
        // Wireframes
        assembler.apply(assembly: MainAssembly())
        assembler.apply(assembly: OverviewAssembly())
        assembler.apply(assembly: SimpleFilterAssembly())
        assembler.apply(assembly: NearbyMealsAssembly())
        assembler.apply(assembly: MealDetailsAssembly())
        assembler.apply(assembly: NearbyVenuesAssembly())
        assembler.apply(assembly: AboutAssembly())
        assembler.apply(assembly: TextViewPopupAssembly())
        
        // Routing
        assembler.apply(assembly: RouterAssembly())
        
        os_log(.debug, "Available through Swinject Container: %@", String(describing: assembler.resolver))
    }
    
    private func bootstrapLocalDatabase() {
        let localDb = assembler.resolver.resolve(LocalDatabaseBootstrapProtocol.self)!
        localDb.bootstrap()
    }
}
