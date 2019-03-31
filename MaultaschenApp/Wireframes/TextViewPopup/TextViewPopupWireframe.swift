//
//  TextViewPopupWireframe.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 02.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit

protocol TextViewPopupWireframeProtocol: WireframeProtocol {
    func configure(withModel: TextViewPopupModel)
}

class TextViewPopupWireframe: TextViewPopupWireframeProtocol {
    
    let shouldBeEmbeddedInNavigationViewController: Bool = false
    
    let viewController: UIViewController
    private let presenter: TextViewPopupPresenterProtocol
    
    init(viewController: UIViewController,
         presenter: TextViewPopupPresenterProtocol) {
        self.viewController = viewController
        self.presenter = presenter
    }
    
    func configure(withModel model: TextViewPopupModel) {
        presenter.configurePopup(withModel: model)
    }
    
}
