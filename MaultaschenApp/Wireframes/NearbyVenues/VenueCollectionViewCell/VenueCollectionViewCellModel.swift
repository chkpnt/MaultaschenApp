//
//  VenueCollectionViewCellModel.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 18.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit

class VenueCollectionViewCellModel {
    
    let venue: String
    let image: UIImage?
    
    init(venue: String, image: UIImage?) {
        self.venue = venue
        self.image = image
    }
}
