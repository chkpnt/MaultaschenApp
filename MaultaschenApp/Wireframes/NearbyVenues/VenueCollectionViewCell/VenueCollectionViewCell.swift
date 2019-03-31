//
//  VenueCollectionViewCell.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 18.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit

class VenueCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var venueLabel: UILabel!

}

extension VenueCollectionViewCell {
    
    func configure(with model: VenueCollectionViewCellModel) {
        imageView.image = model.image
        venueLabel.text = model.venue
    }
}

