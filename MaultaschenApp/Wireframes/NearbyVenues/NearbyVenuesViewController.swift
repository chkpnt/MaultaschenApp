//
//  NearbyVenuesViewController.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 18.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation
import UIKit
import os.log

//sourcery: AutoMockable
protocol NearbyVenuesViewProtocol: AnyObject {
    func show(venues: [VenueCollectionViewCellModel])
}

extension NearbyVenuesViewController: NearbyVenuesViewProtocol {
    
    func show(venues: [VenueCollectionViewCellModel]) {
        self.venues = venues
        collectionView.reloadData()
    }
    
}

class NearbyVenuesViewController: UICollectionViewController {
    
    private let presenter: NearbyVenuesPresenterProtocol
    private var venues: [VenueCollectionViewCellModel] = []
    
    init(presenter: NearbyVenuesPresenterProtocol) {
        self.presenter = presenter
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        os_log(.debug, "deinit %@", String(describing: self))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        collectionView.backgroundColor = .orange
        collectionView.register(R.nib.venueCollectionViewCell)
        presenter.viewDidLoad()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return venues.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let venueViewModel = venues[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.venueCollectionViewCell, for: indexPath)!
        cell.configure(with: venueViewModel)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // not implemented yet
    }
}

extension NearbyVenuesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
}
