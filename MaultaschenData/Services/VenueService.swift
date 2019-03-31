//
//  VenueService.swift
//  MaultaschenData
//
//  Created by Gregor Dschung on 18.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import CoreLocation
import MaultaschenDomain

class VenueService {
    
    private let db: LocalDatabaseProtocol
    
    init(db: LocalDatabaseProtocol) {
        self.db = db
    }
    
}

extension VenueService: VenueServiceProtocol {
    
    /// Of course this would be async in reality
    public func getNearbyVenues() -> [Venue] {
        // 1. Detetermine position
        let location = CLLocationCoordinate2D(latitude: 48.78232, longitude: 9.17702) // Stuttgart
        let radius: CLLocationDistance = 500.0

        // 2. Ask the local db for all known venues near the location
        return db.findAllVenues(near: location, maxDistance: radius)
    }
    
}
