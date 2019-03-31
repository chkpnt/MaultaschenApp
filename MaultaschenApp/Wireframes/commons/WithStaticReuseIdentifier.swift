//
//  WithDerivedReuseIdentifier.swift
//  Meals
//
//  Created by Gregor Dschung on 19.01.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit

protocol WithStaticReuseIdentifier {
    static var reuseIdentifier: String { get }
}

extension UITableViewCell: WithStaticReuseIdentifier {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
