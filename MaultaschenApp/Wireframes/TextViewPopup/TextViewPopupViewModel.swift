//
//  TextViewPopupViewModel.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 03.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation

struct TextViewPopupViewModel {
    
    let title: String?
    let text: String?
    var hideTitle: Bool { return title == nil }
    var hideText: Bool { return text == nil }

}
