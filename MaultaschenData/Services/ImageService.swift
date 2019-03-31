//
//  ImageService.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit
import MaultaschenDomain

class ImageService: ImageServiceProtocol {
    
    func getImage(for meal: Meal) -> UIImage {
        guard let image = UIImage(named: meal.id, in: maultaschenDataBundle, compatibleWith: nil) else {
            return R.image.questionmark()!
        }
        
        return image
    }
    
}
