//
//  TextViewPopupPresenter.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 02.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol TextViewPopupPresenterProtocol: AnyObject {
    func didTapClose()
    func configurePopup(withModel model: TextViewPopupModel)
}

class TextViewPopupPresenter: TextViewPopupPresenterProtocol {
    
    private weak var view: TextViewPopupViewProtocol?
    private let router: TextViewPopupRouterProtocol
    
    init(router: TextViewPopupRouterProtocol) {
        self.router = router
    }
    
    func set(view: TextViewPopupViewProtocol) {
        self.view = view
    }
    
    func configurePopup(withModel model: TextViewPopupModel) {
        let viewModel = model.asViewModel()
        view?.configurePopup(withModel: viewModel)
    }
    
    func didTapClose() {
        router.closePopup()
    }
    
}

private extension TextViewPopupModel {
    
    func asViewModel() -> TextViewPopupViewModel {
        return TextViewPopupViewModel(title: title, text: text)
    }
}
