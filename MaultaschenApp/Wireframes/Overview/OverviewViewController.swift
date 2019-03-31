//
//  OverviewViewController.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 23.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit
import os.log

protocol OverviewViewProtocol: AnyObject {
    func add(wireframe: WireframeProtocol, height: CGFloat?)
}

extension OverviewViewController: OverviewViewProtocol {
    
    func add(wireframe: WireframeProtocol, height: CGFloat?) {
        add(wireframe.viewController, height: height)
    }
}

class OverviewViewController: UIViewController {
    
    private let presenter: OverviewPresenterProtocol

    private var scrollView: UIScrollView?
    private var stackView: UIStackView?
    
    deinit {
        os_log(.debug, "deinit %@", self)
    }
    
    init(presenter: OverviewPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureConstraints()
        configureKeyboardToDismiss()
        presenter.viewDidLoad()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        let stackView = UIStackView()
        stackView.backgroundColor = UIColor.red
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        self.stackView = stackView
        
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.yellow
        scrollView.addSubview(stackView)
        self.scrollView = scrollView
        
        view.addSubview(scrollView)
    }
    
    private func configureConstraints() {
        guard let stackView = stackView, let scrollView = scrollView else { return }
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    private func configureKeyboardToDismiss() {
        let tapRecognizer = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
        let swipeRecognizer = UISwipeGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        swipeRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeRecognizer)
    }
    
    private func add(_ child: UIViewController, height: CGFloat? = nil) {
        guard let stackView = stackView else { return }
        
        let container = UIView()
        container.addSubview(child.view)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        if let height = height {
            container.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        child.view.translatesAutoresizingMaskIntoConstraints = false
        child.view.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        child.view.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        child.view.widthAnchor.constraint(equalTo: container.widthAnchor).isActive = true
        child.view.heightAnchor.constraint(equalTo: container.heightAnchor).isActive = true
        
        addChild(child)
        stackView.addArrangedSubview(container)
        child.didMove(toParent: self)
    }
    
}
