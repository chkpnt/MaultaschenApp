//
//  NearbyVenuesInteractor.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 18.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
public protocol NearbyVenuesInteractorProtocol: AnyObject {
    func findVenues()
    func set(delegate: NearbyVenuesInteractorDelegate)
}

//sourcery: AutoMockable
public protocol NearbyVenuesInteractorDelegate: AnyObject {
    func didFind(venues: [Venue])
}

class NearbyVenuesInteractor: NearbyVenuesInteractorProtocol {
    
    private let venueService: VenueServiceProtocol
    private weak var delegate: NearbyVenuesInteractorDelegate?
    
    init(venueService: VenueServiceProtocol) {
        self.venueService = venueService
    }
    
    func set(delegate: NearbyVenuesInteractorDelegate) {
        self.delegate = delegate
    }
    
    func findVenues() {
        // Of course this would be async in reality
        let venues = venueService.getNearbyVenues()
        delegate?.didFind(venues: venues)
    }
}
