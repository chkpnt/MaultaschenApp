//
//  AboutViewController.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 25.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit
import os.log

//sourcery: AutoMockable
protocol AboutViewProtocol: AnyObject {
}

extension AboutViewController: AboutViewProtocol {
    
}

class AboutViewController: UIViewController {
    
    @IBOutlet private var headerLabel: UILabel!
    @IBOutlet private var subheaderLabel: UILabel!
    @IBOutlet private var randomTextLabel: UILabel!
    @IBOutlet private var rateButton: UIButton!
    
    private var presenter: AboutPresenter?
    
    func set(presenter: AboutPresenter) {
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        let viewModel = presenter?.viewModel()
        headerLabel.text = viewModel?.header
        subheaderLabel.text = viewModel?.subheader
        randomTextLabel.text = viewModel?.longtext
        rateButton.setTitle(viewModel?.rateButtonText, for: .normal)
    }
    
    @IBAction private func didTapRateButton() {
        presenter?.didTapRateButton()
    }
    
    deinit {
        os_log(.debug, "deinit %@", String(describing: self))
    }
}
