//
//  NearbyMealsAssembly.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import Swinject
import MaultaschenDomain

class NearbyMealsAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(NearbyMealsWireframeProtocol.self) { r in
            let router = r.resolve(NearbyMealsRouterProtocol.self)!
            let interactor = r.resolve(NearbyMealsInteractorProtocol.self)!
            
            let presenter = NearbyMealsPresenter(interactor: interactor)
            let viewController = NearbyMealsViewController(presenter: presenter)
            
            presenter.set(view: viewController)
            presenter.set(router: router)
            interactor.set(delegate: presenter)
            
            return NearbyMealsWireframe(viewController: viewController, presenter: presenter)
        }
    }
    
}
