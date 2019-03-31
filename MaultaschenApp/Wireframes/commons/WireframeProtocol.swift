//
//  WireframeProtocol.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import UIKit

protocol WireframeProtocol: AnyObject {
    
    var viewController: UIViewController { get }
    var shouldBeEmbeddedInNavigationViewController: Bool { get }
    
    /// Can be implemented if the wireframes is able to configure a UITabBarItem
    func configure(tabBarItem: UITabBarItem)
}

extension WireframeProtocol {
    
    func configure(tabBarItem: UITabBarItem) {
    }
}
