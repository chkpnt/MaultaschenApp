//
//  ConfigurableRow.swift
//  Meals
//
//  Created by Gregor Dschung on 18.01.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit
import Rswift

protocol Row {
    var nib: UINib? { get }
    var cellClass: UITableViewCell.Type { get }
    var cellIdentifier: String { get }
    func configure(cell: UITableViewCell)
}

class CellRow<TCell: UITableViewCell>: Row {
    
    typealias CellConfigurator = (TCell) -> Void
    
    let nib: UINib?
    let cellClass: UITableViewCell.Type
    let cellIdentifier: String
    
    private let configurator: CellConfigurator

    init(nib: UINib? = nil,
         configurator: @escaping CellConfigurator) {
        self.nib = nib
        self.cellIdentifier = TCell.reuseIdentifier
        self.cellClass = TCell.self
        self.configurator = configurator
    }
    
    convenience init(nibResource: NibResourceType, configurator: @escaping CellConfigurator) {
        self.init(nib: UINib(resource: nibResource), configurator: configurator)
    }

    func configure(cell: UITableViewCell) {
        guard let cell = cell as? TCell else { return }
        configurator(cell)
    }
    
}
