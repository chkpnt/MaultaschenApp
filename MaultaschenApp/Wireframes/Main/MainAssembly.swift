//
//  MainAssembly.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import Swinject

class MainAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(MainWireframeProtocol.self) { r in
            let findMaultaschenWireframe = r.resolve(NearbyMealsWireframeProtocol.self)!
//            let overviewWireframe = r.resolve(OverviewWireframeProtocol.self)!
            let aboutWireframe = r.resolve(AboutWireframeProtocol.self)!
            
            let mainView = MainViewController()
            mainView.set(wireframes: [findMaultaschenWireframe, aboutWireframe])
            
            return MainWireframe(viewController: mainView)
        }
    }
    
    // Without a DI-Container, somthing like this could be used:
//    func create(router: Router) -> MainWireframeProtocol {
//        let findMaultaschenWireframe = NearbyMealsAssembly().create()
//        let aboutWireframe = AboutAssembly().create(router: router)
//        
//        let mainView = MainViewController()
//        mainView.set(wireframes: [findMaultaschenWireframe, aboutWireframe])
//
//        return MainWireframe(viewController: mainView)
//    }
}

