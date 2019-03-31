//
//  SimpleFilterWireframe.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 25.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit

protocol SimpleFilterWireframeProtocol: WireframeProtocol {
    func set(router: SimpleFilterRouterProtocol)
}

class SimpleFilterWireframe: SimpleFilterWireframeProtocol {
    
    let shouldBeEmbeddedInNavigationViewController: Bool = false
    
    private(set) var viewController: UIViewController
    private let presenter: SimpleFilterPresenter
    
    init(viewController: UIViewController,
         presenter: SimpleFilterPresenter) {
        self.viewController = viewController
        self.presenter = presenter
    }
    
    func set(router: SimpleFilterRouterProtocol) {
        presenter.set(router: router)
    }
    
}
