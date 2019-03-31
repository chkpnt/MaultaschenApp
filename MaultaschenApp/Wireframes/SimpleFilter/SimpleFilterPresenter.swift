//
//  SimpleFilterPresenter.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 25.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation

protocol SimpleFilterPresenterProtocol {
    
    func didChangeText(to: String)
    func didTapButton()
}

class SimpleFilterPresenter: SimpleFilterPresenterProtocol {
    
    private weak var router: SimpleFilterRouterProtocol?
    
    func set(router: SimpleFilterRouterProtocol) {
        self.router = router
    }
    
    func didChangeText(to text: String) {
        router?.filter(by: text)
    }
    
    func didTapButton() {
        router?.didTapFilterButton()
    }
}
