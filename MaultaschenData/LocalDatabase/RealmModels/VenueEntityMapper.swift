//
//  VenueEntityMapper.swift
//  MaultaschenData
//
//  Created by Gregor Dschung on 17.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import MaultaschenDomain

//sourcery: AutoMockable
protocol VenueEntityMapperProtocol {
    func map(entity: VenueEntity) -> Venue
    func map(venue: Venue) -> VenueEntity
}

class VenueEntityMapper: VenueEntityMapperProtocol {

    func map(entity: VenueEntity) -> Venue {
        let venue = Venue(id: entity.id)
        venue.name = entity.name
        return venue
    }

    func map(venue: Venue) -> VenueEntity {
        let entity = VenueEntity()
        entity.id = venue.id
        entity.name = venue.name
        return entity
    }
}
