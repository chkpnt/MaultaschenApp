//
//  NearbyVenuesAssembly.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 18.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import Swinject
import MaultaschenDomain

class NearbyVenuesAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(NearbyVenuesWireframeProtocol.self) { r in
            let router = r.resolve(NearbyVenuesRouterProtocol.self)!
            let interactor = r.resolve(NearbyVenuesInteractorProtocol.self)!
            
            let presenter = NearbyVenuesPresenter(interactor: interactor, router: router)
            let viewController = NearbyVenuesViewController(presenter: presenter)
            
            presenter.set(view: viewController)
            interactor.set(delegate: presenter)
            
            return NearbyVenuesWireframe(viewController: viewController, presenter: presenter)
        }
    }
    
}
