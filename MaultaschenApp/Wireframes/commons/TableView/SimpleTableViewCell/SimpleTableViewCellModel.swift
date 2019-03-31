//
//  SimpleTableViewCellModel.swift
//  Meals
//
//  Created by Gregor Dschung on 18.01.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation

class SimpleTableViewCellModel {
    
    let text: Observable<String>
    
    init(text: String) {
        self.text = Observable(value: text)
    }
}
