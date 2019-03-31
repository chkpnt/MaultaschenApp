//
//  UIApplication+topViewController.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 02.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import UIKit

public extension UIApplication {
    
    class func topViewController(_ root: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        let viewController: UIViewController?
        
        if let nav = root as? UINavigationController {
            viewController = topViewController(nav.visibleViewController)
        } else if let tab = root as? UITabBarController, let selected = tab.selectedViewController {
            viewController = topViewController(selected)
        } else if let presented = root?.presentedViewController {
            viewController = topViewController(presented)
        } else {
            viewController = root
        }
        
        return viewController
    }
}
