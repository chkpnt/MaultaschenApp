//
//  NearbyVenuesInteractor.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 18.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import MaultaschenData

//sourcery: AutoMockable
protocol NearbyVenuesInteractorProtocol: AnyObject {
    func findVenues()
}

//sourcery: AutoMockable
protocol NearbyVenuesInteractorDelegate: AnyObject {
    func didFind(venues: [Venue])
}

class NearbyVenuesInteractor: NearbyVenuesInteractorProtocol {
    
    private let venueRepository: VenueRepositoryProtocol
    private weak var delegate: NearbyVenuesInteractorDelegate?
    
    init(venueRepository: VenueRepositoryProtocol) {
        self.venueRepository = venueRepository
    }
    
    func set(delegate: NearbyVenuesInteractorDelegate) {
        self.delegate = delegate
    }
    
    func findVenues() {
        let venues = venueRepository.getNearbyVenues()
        delegate?.didFind(venues: venues)
    }
}
