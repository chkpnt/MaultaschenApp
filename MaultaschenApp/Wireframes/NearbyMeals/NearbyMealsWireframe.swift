//
//  NearbyMealsWireframe.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit

protocol NearbyMealsWireframeProtocol: WireframeProtocol {
    func set(router: NearbyMealsRouterProtocol)
    func filterMeals(by name: String)
}

class NearbyMealsWireframe: NearbyMealsWireframeProtocol {
    let shouldBeEmbeddedInNavigationViewController: Bool = true
    
    private(set) var viewController: UIViewController
    private let presenter: NearbyMealsPresenterProtocol
    
    init(viewController: UIViewController, presenter: NearbyMealsPresenterProtocol) {
        self.viewController = viewController
        self.presenter = presenter
    }
    
    func set(router: NearbyMealsRouterProtocol) {
        (presenter as? NearbyMealsPresenter)?.set(router: router)
    }
    
    func filterMeals(by name: String) {
        presenter.filterMeals(by: name)
    }
    
    func configure(tabBarItem: UITabBarItem) {
        #if USE_R
        tabBarItem.title = R.string.nearbyMeals.tabBarItemTitle()
        tabBarItem.image = R.image.nearbyMealsTabBarIcon()
        #else
        tabBarItem.title = NSLocalizedString("TabBarItemTitle", tableName: "NearbyMeals", comment: "")
        tabBarItem.image = UIImage(named: "nearbyMealsTabBarIcon")
        #endif
    }
}
