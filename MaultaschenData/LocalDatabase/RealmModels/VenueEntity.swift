//
//  VenueEntity.swift
//  MaultaschenData
//
//  Created by Gregor Dschung on 11.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import RealmSwift

final class VenueEntity: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
