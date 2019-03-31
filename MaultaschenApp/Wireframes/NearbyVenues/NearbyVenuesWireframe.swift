//
//  NearbyVenuesWireframe.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 18.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit

protocol NearbyVenuesWireframeProtocol: WireframeProtocol {
    func filterVenues(by name: String)
}

class NearbyVenuesWireframe: NearbyVenuesWireframeProtocol {
    
    let shouldBeEmbeddedInNavigationViewController: Bool = true
    
    private(set) var viewController: UIViewController
    private let presenter: NearbyVenuesPresenterProtocol

    init(viewController: UIViewController,
         presenter: NearbyVenuesPresenterProtocol) {
        self.viewController = viewController
        self.presenter = presenter
    }
    
    func filterVenues(by name: String) {
        presenter.filerVenues(by: name)
    }
    
    func configure(tabBarItem: UITabBarItem) {
        tabBarItem.title = "Venues"
        tabBarItem.image = R.image.nearbyVenuesTabBarIcon()
    }
    
}
