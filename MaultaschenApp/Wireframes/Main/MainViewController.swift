//
//  MainViewController.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import UIKit
import os.log

class MainViewController: UITabBarController {

    private var wireframes: [WireframeProtocol] = []
    
    deinit {
        os_log(.debug, "deinit %@", self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func set(wireframes: [WireframeProtocol]) {
        self.wireframes = wireframes
        reload()
    }
    
    private func reload() {
        let viewControllers: [UIViewController] = wireframes.map { wireframe in
            let viewController = wireframe.shouldBeEmbeddedInNavigationViewController
                ? UINavigationController(rootViewController: wireframe.viewController)
                : wireframe.viewController
            wireframe.configure(tabBarItem: viewController.tabBarItem)
            return viewController
        }
        self.viewControllers = viewControllers
    }
    
}

