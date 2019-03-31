//
//  VenueServiceProtocol.swift
//  MaultaschenDomain
//
//  Created by Gregor Dschung on 31.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation

public protocol VenueServiceProtocol {
    func getNearbyVenues() -> [Venue]
}
