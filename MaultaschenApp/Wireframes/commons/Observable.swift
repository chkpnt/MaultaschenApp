//
//  Observable.swift
//  Meals
//
//  Created by Gregor Dschung on 20.01.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation

final class Observable<T> {
    
    var value: T {
        didSet {
            DispatchQueue.main.async {
                self.valueChanged?(self.value)
            }
        }
    }
    
    private var valueChanged: ((T) -> Void)?
    
    init(value: T) {
        self.value = value
    }
    
    func setObserver(_ onChange: ((T) -> Void)?) {
        valueChanged = onChange
    }
    
    func removeObserver() {
        valueChanged = nil
    }
}
