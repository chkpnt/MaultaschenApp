//
//  SimpleFilterAssembly.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 25.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import Swinject

class SimpleFilterAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(SimpleFilterWireframeProtocol.self) { r in            
            let presenter = SimpleFilterPresenter()
            let viewController = R.storyboard.simpleFilter.simpleFilterViewController()!
            viewController.set(presenter: presenter)
            
            return SimpleFilterWireframe(viewController: viewController, presenter: presenter)
        }
    }
}
