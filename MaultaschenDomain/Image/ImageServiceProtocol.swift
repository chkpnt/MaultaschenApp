//
//  ImageServiceProtocol.swift
//  MaultaschenDomain
//
//  Created by Gregor Dschung on 31.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
public protocol ImageServiceProtocol {
    func getImage(for meal: Meal) -> UIImage
}
