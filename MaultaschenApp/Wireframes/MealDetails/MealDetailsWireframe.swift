//
//  MealDetailsWireframe.swift
//  Meals
//
//  Created by Gregor Dschung on 15.01.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit
import MaultaschenData

protocol MealDetailsWireframeProtocol: WireframeProtocol {
    func show(meal: Meal)
}

class MealDetailsWireframe: MealDetailsWireframeProtocol {
    let shouldBeEmbeddedInNavigationViewController: Bool = true
    
    private(set) var viewController: UIViewController
    private let presenter: MealDetailsPresenterProtocol
    
    init(viewController: UIViewController, presenter: MealDetailsPresenterProtocol) {
        self.viewController = viewController
        self.presenter = presenter
    }
    
    func show(meal: Meal) {
        presenter.show(meal: meal)
    }
    
}
