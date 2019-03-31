//
//  TextTableViewCellModel.swift
//  Meals
//
//  Created by Gregor Dschung on 22.01.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation

class TextTableViewCellModel {
    
    enum Mode {
        case view
        case edit
    }
    
    let mode: Observable<Mode> = Observable(value: .view)
    let text: Observable<String> = Observable(value: "")
    
}
