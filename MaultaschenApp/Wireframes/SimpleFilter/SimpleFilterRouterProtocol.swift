//
//  SimpleFilterRouterProtocol.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 25.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation

protocol SimpleFilterRouterProtocol: AnyObject {
    func filter(by: String)
    func didTapFilterButton()
}
