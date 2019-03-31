//
//  Router.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit
import Swinject
import MaultaschenDomain

class Router {
    
    private let serviceLocator: Resolver
    
    private var popup: UIViewController?
    
    init(serviceLocator: Resolver) {
        self.serviceLocator = serviceLocator
    }
}

extension Router: NearbyMealsRouterProtocol {
    
    func showDetails(for meal: Meal) {
        let wireframe = serviceLocator.resolve(MealDetailsWireframeProtocol.self)!
        wireframe.show(meal: meal)
        UIApplication.topViewController()?.navigationController?.pushViewController(wireframe.viewController, animated: true)
    }
    
}

extension Router: AboutRouterProtocol {

    func showWriteReview() {
        let model = TextViewPopupModel(
            title: "Header",
            text: R.string.about.thanksForReview()
        )

        let popupWireframe = serviceLocator.resolve(TextViewPopupWireframeProtocol.self)!
        popupWireframe.configure(withModel: model)
        let viewController = popupWireframe.viewController
        popup = viewController
        UIApplication.topViewController()?.present(viewController, animated: true, completion: nil)
    }

}

extension Router: TextViewPopupRouterProtocol {

    func closePopup() {
        popup?.dismiss(animated: false, completion: nil)
        popup = nil
    }

}

extension Router: MealDetailsRouterProtocol {}

extension Router: NearbyVenuesRouterProtocol {}

extension Router: OverviewRouterProtocol {}
