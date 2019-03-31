//
//  MealDetailsAssembly.swift
//  Meals
//
//  Created by Gregor Dschung on 13.01.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit
import Swinject
import os.log
import MaultaschenDomain

public class MealDetailsAssembly: Assembly {
    
    public func assemble(container: Container) {
        container.register(MealDetailsWireframeProtocol.self) { r in
            let router = r.resolve(MealDetailsRouterProtocol.self)!
            let interactor = r.resolve(MealDetailsInteractorProtocol.self)!
            
            let presenter = MealDetailsPresenter(interactor: interactor)
            let viewController = MealDetailsViewController(presenter: presenter)
            
            presenter.set(view: viewController)
            presenter.set(router: router)
            interactor.set(delegate: presenter)
            
            return MealDetailsWireframe(viewController: viewController, presenter: viewController.presenter)
        }
        
    }
    
}
