//
//  NearbyMealsAssembly.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import Swinject
import MaultaschenData

class NearbyMealsAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(NearbyMealsWireframeProtocol.self) { r in
            let mealRepository = r.resolve(MealRepositoryProtocol.self)!
            let imageRepository = r.resolve(ImageRepositoryProtocol.self)!
            let router = r.resolve(NearbyMealsRouterProtocol.self)!
            
            let interactor = NearbyMealsInteractor(mealRepository: mealRepository, imageRepository: imageRepository)
            let presenter = NearbyMealsPresenter(interactor: interactor)
            let viewController = NearbyMealsViewController(presenter: presenter)
            presenter.set(view: viewController)
            presenter.set(router: router)
            
            return NearbyMealsWireframe(viewController: viewController, presenter: presenter)
        }.inObjectScope(.transient)
    }
    
    
//    func create() -> NearbyMealsWireframe {
//        let interactor = NearbyMealsInteractor(mealRepository: MealRepository(), imageRepository: ImageRepository())
//        let presenter = NearbyMealsPresenter(interactor: interactor)
//        let viewController = NearbyMealsViewController(presenter: presenter)
//        presenter.set(view: viewController)
//
//        return NearbyMealsWireframe(viewController: viewController)
//    }
}
