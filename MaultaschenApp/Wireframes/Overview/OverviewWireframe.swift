//
//  OverviewWireframe.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 23.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit

protocol OverviewWireframeProtocol: WireframeProtocol {
}

class OverviewWireframe: OverviewWireframeProtocol {
    
    private(set) var viewController: UIViewController
    let shouldBeEmbeddedInNavigationViewController: Bool = true
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func configure(tabBarItem: UITabBarItem) {
        tabBarItem.title = OverviewStrings.tabBarItemTitle
        tabBarItem.image = R.image.overviewTabBarIcon()
    }
}
