//
//  SimpleFilterViewController.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 25.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit

class SimpleFilterViewController: UIViewController {
    
    @IBOutlet private var filterTextField: UITextField!
    private var presenter: SimpleFilterPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterTextField.delegate = self
    }
    
    func set(presenter: SimpleFilterPresenterProtocol) {
        self.presenter = presenter
    }
    
    @IBAction private func didChangeText(_ sender: UITextField) {
        let text = sender.text ?? ""
        presenter?.didChangeText(to: text)
    }
    
    @IBAction private func didTapButton() {
        presenter?.didTapButton()
    }
}

extension SimpleFilterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
