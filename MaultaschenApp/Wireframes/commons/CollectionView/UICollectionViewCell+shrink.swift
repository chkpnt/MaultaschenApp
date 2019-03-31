//
//  UICollectionViewCell+shrink.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 31.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    
    func shrink() {
        UIView.animate(
            withDuration: 0.5,
            animations: {
                self.transform = CGAffineTransform.identity
            }
        )
    }
}
