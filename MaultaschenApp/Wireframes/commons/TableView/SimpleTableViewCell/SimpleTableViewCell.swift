//
//  SimpleTableViewCell.swift
//  Meals
//
//  Created by Gregor Dschung on 18.01.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit

class SimpleTableViewCell: UITableViewCell {
    
    private var viewModel: SimpleTableViewCellModel? {
        didSet {
            textLabel?.text = viewModel?.text.value
            viewModel?.text.setObserver { [weak self] in self?.textLabel?.text = $0 }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel?.text.removeObserver()
        viewModel = nil
    }
}

extension SimpleTableViewCell: ConfigurableCell {
    
    func configure(with model: SimpleTableViewCellModel) {
        selectionStyle = .none
        viewModel = model
    }
}
