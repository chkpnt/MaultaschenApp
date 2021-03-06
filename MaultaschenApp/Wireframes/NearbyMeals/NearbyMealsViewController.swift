//
//  NearbyMealsViewController.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import UIKit
import StoreKit

//sourcery: AutoMockable
protocol NearbyMealsViewProtocol: AnyObject {
    func show(meals: [MealCollectionViewCellModel])
}

// I have NO converns writing this extension "above" the ViewController.
// Pro point: The protocol implementation is THE important thing
// from the presenter's perspective, the ViewController itself
// is a detail. And its mostly reasonable to put the most important
// stuff above.
extension NearbyMealsViewController: NearbyMealsViewProtocol {
    
    func show(meals: [MealCollectionViewCellModel]) {
        self.meals = meals
        collectionView.reloadData()
    }
    
}

class NearbyMealsViewController: UICollectionViewController {
    
    private let presenter: NearbyMealsPresenterProtocol
    private var meals: [MealCollectionViewCellModel] = []
    
    init(presenter: NearbyMealsPresenterProtocol) {
        self.presenter = presenter
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        #if USE_R
        collectionView.register(R.nib.mealCollectionViewCell)
        #else
        collectionView.register(UINib(nibName: "MealCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MealCollectionViewCell")
        #endif
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let indexPaths = collectionView.indexPathsForSelectedItems ?? []
        indexPaths.map { collectionView.cellForItem(at: $0) }
            .forEach { $0?.shrink() }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.findMeals()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let maultascheViewModel = meals[indexPath.row]
        
        #if USE_R
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.mealCollectionViewCell, for: indexPath)!
        #else
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MealCollectionViewCell", for: indexPath) as! MealCollectionViewCell
        #endif
        
        cell.configure(with: maultascheViewModel)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.grow()
        
        let mealModel = meals[indexPath.row]
        presenter.didTap(meal: mealModel)
    }

}

extension NearbyMealsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
}
