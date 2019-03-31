//
//  AboutWireframe.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 25.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit

protocol AboutWireframeProtocol: WireframeProtocol {
    
}

class AboutWireframe: AboutWireframeProtocol {
    
    private(set) var viewController: UIViewController
    let shouldBeEmbeddedInNavigationViewController: Bool = false

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func configure(tabBarItem: UITabBarItem) {
        #if USE_R
        tabBarItem.title = R.string.about.tabBarItemTitle()
        tabBarItem.image = R.image.aboutTabBarIcon()
        #else
        tabBarItem.title = NSLocalizedString("TabBarItemTitle", tableName: "About", bundle: Bundle.main, comment: "")
        tabBarItem.image = UIImage(named: "aboutTabBarIcon")
        #endif
    }
}
