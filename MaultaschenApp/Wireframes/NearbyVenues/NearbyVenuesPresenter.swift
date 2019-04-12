//
//  NearVenuesPresenter.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 18.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import MaultaschenDomain

protocol NearbyVenuesPresenterProtocol: AnyObject {
    func findVenues()
    func filerVenues(by name: String)
}

class NearbyVenuesPresenter: NearbyVenuesPresenterProtocol {
    
    private let interactor: NearbyVenuesInteractorProtocol
    private let router: NearbyVenuesRouterProtocol
    private weak var view: NearbyVenuesViewProtocol?
    
    private var currentViewModels: [VenueCollectionViewCellModel] = []
    private var currentActiveFilter: String = ""
    
    init(interactor: NearbyVenuesInteractorProtocol,
         router: NearbyVenuesRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func set(view: NearbyVenuesViewProtocol) {
        self.view = view
    }
    
    func findVenues() {
        interactor.findVenues()
    }
    
    func filerVenues(by name: String) {
        currentActiveFilter = name
        updateView()
    }
    
    private func updateView() {
        guard !currentActiveFilter.isEmpty else {
            view?.show(venues: currentViewModels)
            return
        }
        
        let filteredViewModels = currentViewModels.filter { $0.venue.localizedCaseInsensitiveContains(currentActiveFilter) }
        view?.show(venues: filteredViewModels)
    }
    
}

extension NearbyVenuesPresenter: NearbyVenuesInteractorDelegate {
    
    func didFind(venues: [Venue]) {
        currentViewModels = venues.map { VenueCollectionViewCellModel(venue: $0.name, image: R.image.no_image()) }
        updateView()
    }
    
}
