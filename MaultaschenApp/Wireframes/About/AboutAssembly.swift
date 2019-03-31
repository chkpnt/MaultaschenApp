//
//  AboutAssembly.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 25.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import Swinject

class AboutAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(AboutWireframeProtocol.self) { r in
            let router = r.resolve(AboutRouterProtocol.self)!
            
            let presenter = AboutPresenter(router: router)
            #if USE_R
            let viewController = R.storyboard.about.aboutViewController()!
            #else
            let storyboard = UIStoryboard(name: "About", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
            #endif
            viewController.set(presenter: presenter)
            
            return AboutWireframe(viewController: viewController)
        }
    }
    
//    func create(router: AboutRouterProtocol) -> AboutWireframe {
//        let presenter = AboutPresenter(router: router)
//        #if USE_R
//        let viewController = R.storyboard.about.aboutViewController()!
//        #else
//        let storyboard = UIStoryboard(name: "About", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
//        #endif
//        viewController.set(presenter: presenter)
//        return AboutWireframe(viewController: viewController)
//    }
    
}
