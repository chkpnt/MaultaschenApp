//
//  TextViewPopupModel.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 02.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation

struct TextViewPopupModel {
    let title: String?
    let text: String?

    public init(title: String?, text: String?) {
        self.title = title
        self.text = text
    }
}

extension TextViewPopupModel: Hashable {
    
}
