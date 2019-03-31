//
//  OverviewAssembly.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 23.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import Swinject

class OverviewAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(OverviewWireframeProtocol.self) { r in
            let router = r.resolve(OverviewRouterProtocol.self)!
            let simpleFilterWireframe = r.resolve(SimpleFilterWireframeProtocol.self)!
            let nearbyVenuesWireframe = r.resolve(NearbyVenuesWireframeProtocol.self)!
            let findMealsWireframe = r.resolve(NearbyMealsWireframeProtocol.self)!
            let presenter = OverviewPresenter(
                filterWireframe: simpleFilterWireframe,
                nearbyVenuesWireframe: nearbyVenuesWireframe,
                findMealsWireframe: findMealsWireframe
            )
            
            let view = OverviewViewController(presenter: presenter)
            presenter.set(view: view)
            presenter.set(router: router)
            
            simpleFilterWireframe.set(router: presenter)
            findMealsWireframe.set(router: presenter)
            
            return OverviewWireframe(viewController: view)
        }
    }
    
}
