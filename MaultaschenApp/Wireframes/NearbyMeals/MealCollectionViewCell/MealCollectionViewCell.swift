//
//  MealCollectionViewCell.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit

class MealCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var venueLabel: UILabel!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var priceLabel: UILabel!
}

extension MealCollectionViewCell {
    func configure(with model: MealCollectionViewCellModel) {
        imageView.image = model.image
        venueLabel.text = model.venue
        titleLabel.text = model.title
        priceLabel.text = model.price
    }
}
