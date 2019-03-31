//
//  TextTableViewCell.swift
//  Meals
//
//  Created by Gregor Dschung on 22.01.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit

class TextTableViewCell: UITableViewCell {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var underlineView: UIView!
    @IBOutlet var underlineHeightConstraint: NSLayoutConstraint!
    
    private var viewModel: TextTableViewCellModel? {
        didSet {
            textField?.text = viewModel?.text.value
            textField.isUserInteractionEnabled = viewModel?.mode.value == .edit
            underlineHeightConstraint.constant = 0
            viewModel?.text.setObserver { [weak self] in
                self?.textField?.text = $0
            }
            viewModel?.mode.setObserver { [weak self] in
                switch $0 {
                case .edit:
                    self?.enableEditMode()
                case .view:
                    self?.enableViewMode()
                }
            }
        }
    }
    
    @IBAction func didChangeText(_ sender: Any) {
        guard let newValue = textField.text else { return }
        viewModel?.text.value = newValue
    }
    
    private func enableEditMode() {
        textField.isUserInteractionEnabled = true
        underlineHeightConstraint.constant = 1
        underlineView.transform = CGAffineTransform(translationX: underlineView.frame.width, y: 0)
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
            self.underlineView.transform = .identity
        })
    }
    
    private func enableViewMode() {
        textField.isUserInteractionEnabled = false
        underlineHeightConstraint.constant = 0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel?.text.removeObserver()
        viewModel?.text.removeObserver()
        viewModel = nil
    }
}

extension TextTableViewCell: ConfigurableCell {

    func configure(with model: TextTableViewCellModel) {
        selectionStyle = .none
        viewModel = model
    }
//    func configure(with model: SimpleTableViewCellModel) {
//        selectionStyle = .none
//        viewModel = model
//        //        textLabel?.text = model.text.value
//    }
}
