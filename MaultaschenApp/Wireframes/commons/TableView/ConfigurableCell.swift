//
//  ConfigurableCell.swift
//  Meals
//
//  Created by Gregor Dschung on 20.01.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation

protocol ConfigurableCell {
    associatedtype TCellModel
    
    func configure(with model: TCellModel)
}
