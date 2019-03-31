//
//  UICollectionViewCell+grow.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 31.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    
    func grow() {
        UIView.animate(
            withDuration: 0.5,
            animations: {
                self.transform = CGAffineTransform(scaleX: 1.0 + CGFloat(0.3), y: 1.0 + CGFloat(0.3))
            }
        )
    }
}
