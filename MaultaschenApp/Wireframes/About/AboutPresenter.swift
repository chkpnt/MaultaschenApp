//
//  AboutPresenter.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 25.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit

protocol AboutPresenterProtocol: AnyObject {
    func viewModel() -> AboutViewModel
    func didTapRateButton()
}

class AboutPresenter: AboutPresenterProtocol {
    
    private weak var view: AboutViewProtocol?
    private let router: AboutRouterProtocol?
    
    func set(view: AboutViewProtocol) {
        self.view = view
    }
    
    init(router: AboutRouterProtocol) {
        self.router = router
    }
    
    func viewModel() -> AboutViewModel {
        return AboutViewModel(
            header: R.string.about.header(),
            subheader: R.string.about.subheader(),
            longtext: """
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
            
Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet.
""",
            rateButtonText: R.string.about.textOnReviewButton()
        )
    }
    
    func didTapRateButton() {
        router?.showWriteReview()
        
//        let writeReviewUrl = URL(string: "itms-apps://itunes.apple.com/us/app/id447188370?action=write-review")!
//        UIApplication.shared.open(writeReviewUrl, options: [:], completionHandler: nil)
    }
    
}
