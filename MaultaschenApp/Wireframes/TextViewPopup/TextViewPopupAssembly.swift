//
//  TextViewPopupAssembly.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 02.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import Swinject

class TextViewPopupAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.register(TextViewPopupWireframeProtocol.self) { r in
            let router = r.resolve(TextViewPopupRouterProtocol.self)!
            
            let presenter = TextViewPopupPresenter(router: router)
            let viewController = R.storyboard.textViewPopup.textViewPopupViewController()!

            viewController.set(presenter: presenter)
            presenter.set(view: viewController)
            
            return TextViewPopupWireframe(
                viewController: viewController,
                presenter: presenter)
        }
    }

}
