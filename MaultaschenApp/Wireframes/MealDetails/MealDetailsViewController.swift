//
//  MealDetailsViewController.swift
//  Meals
//
//  Created by Gregor Dschung on 13.01.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit
import os.log

//sourcery: AutoMockable
protocol MealDetailsViewProtocol: class {
    func updateImage()
}

extension MealDetailsViewController: MealDetailsViewProtocol {
    func updateImage() {
        imageView?.image = presenter.mealImage
    }
}

class MealDetailsViewController: UIViewController {
    
    let presenter: MealDetailsPresenterProtocol
    
    private var nextButton: UIButton?
    private var imageView: UIImageView?
    private var tableView: UITableView?
        
    private lazy var mealTitleRow: CellRow<TextTableViewCell> = CellRow<TextTableViewCell>(nibResource: R.nib.textTableViewCell) { [unowned self] cell in
        cell.configure(with: self.presenter.mealTitleViewModel )
    }
    private lazy var mealPriceRow: CellRow<TextTableViewCell> = CellRow<TextTableViewCell>(nibResource: R.nib.textTableViewCell) { [unowned self] cell in
        cell.configure(with: self.presenter.mealPriceViewModel )
    }
    private lazy var editModeButton: UIBarButtonItem = { [unowned self] in
        let button = UIBarButtonItem(image: R.image.mealDetailsEditIcon(), style: .plain, target: self, action: #selector(MealDetailsViewController.didTapEditButton) )
        button.tintColor = self.view.tintColor
        return button
    }()

    deinit {
        os_log(.debug, "deinit %@", self)
    }
    
    init(presenter: MealDetailsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
//        navigationItem.title = "Details!"
        
        navigationItem.rightBarButtonItem = editButtonItem
        
        addHeaderImageView()
        addTableView()
        configureConstraints()
        
        add(row: mealTitleRow)
        add(row: mealPriceRow)
    }
 
    private func addHeaderImageView() {
        let imageView = UIImageView()
        imageView.image = presenter.mealImage
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        view.addSubview(imageView)
        
        self.imageView = imageView
    }
    
    private func addTableView() {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = true
        tableView.bounces = false
        view.addSubview(tableView)
        
        self.tableView = tableView
    }
    
    private func configureConstraints() {
        guard let imageView = imageView, let tableView = tableView else { return }
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 1.0).isActive = true
        tableView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1.0).isActive = true
        view.trailingAnchor.constraint(equalToSystemSpacingAfter: tableView.trailingAnchor, multiplier: 1.0).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: tableView.bottomAnchor, multiplier: 1.0).isActive = true
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if editing {
            presenter.didTapEditButton()
        } else {
            presenter.didTapEditDoneButton()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        
        // Bei Implementierung in viewWillDisappear kommt es zu einer komischen Verzögerung
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
    }
    
    private var rows: [Row] = []
    
    private func add(row: Row) {
        rows.append(row)
        if let nib = row.nib {
            tableView?.register(nib, forCellReuseIdentifier: row.cellIdentifier)
        } else {
            tableView?.register(row.cellClass, forCellReuseIdentifier: row.cellIdentifier)
        }
    }
    
    @objc private func didTapEditButton() {
        presenter.didTapEditButton()
    }
}

extension MealDetailsViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.cellIdentifier, for: indexPath)
        row.configure(cell: cell)
        return cell
    }
    
    
}

extension MealDetailsViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}

// Quelle: http://stackoverflow.com/a/30593673

private extension Collection {
    
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
