//
//  TextViewPopupViewController.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 02.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit
import os.log

//sourcery: AutoMockable
protocol TextViewPopupViewProtocol: AnyObject {
    func configurePopup(withModel model: TextViewPopupViewModel)
}

extension TextViewPopupViewController: TextViewPopupViewProtocol {
    
    func configurePopup(withModel model: TextViewPopupViewModel) {
        self.model = model
    }
    
}

class TextViewPopupViewController: UIViewController {
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var closeButton: UIButton!
    
    private var presenter: TextViewPopupPresenterProtocol?
    private var model: TextViewPopupViewModel? {
        didSet { if isViewLoaded { updateUI() } }
    }
    
    func set(presenter: TextViewPopupPresenterProtocol) {
        self.presenter = presenter
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen // Otherwise, the VCs beneth would be removed from the view hierarchy
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        guard let model = model else { return }
        titleLabel.text = model.title
        titleLabel.isHidden = model.hideTitle
        textLabel.text = model.text
        textLabel.isHidden = model.hideText
    }
    
    @IBAction private func didTapClose() {
        presenter?.didTapClose()
    }
    
    deinit {
        os_log(.debug, "deinit %@", String(describing: self))
    }
    
}

private extension UILabel {
    func showIfNeeded() {
        isHidden = text == nil
    }
}
