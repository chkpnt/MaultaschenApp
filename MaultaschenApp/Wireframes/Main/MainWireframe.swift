//
//  MainWireframe.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit

protocol MainWireframeProtocol: WireframeProtocol {
    func setAsRootView()
}

class MainWireframe: MainWireframeProtocol {

    private(set) var viewController: UIViewController
    let shouldBeEmbeddedInNavigationViewController: Bool = false

    private var window: UIWindow?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func setAsRootView() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = viewController
        window?.backgroundColor = UIColor.blue
        window?.makeKeyAndVisible()
    }
    
}
