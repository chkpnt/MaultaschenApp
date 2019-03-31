//
//  main.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import UIKit

fileprivate class AppDelegateDecider {
    
    func delegateClassName() -> String? {
        return isUnitTesting() ? nil : NSStringFromClass(AppDelegate.self)
    }
    
    private func isUnitTesting() -> Bool {
        return NSClassFromString("XCTest") != nil
    }
}

UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    nil,
    AppDelegateDecider().delegateClassName()
)


