//
//  Maultasche.swift
//  MaultaschenApp
//
//  Created by Gregor Dschung on 24.02.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import Foundation

public class Meal {
    public let id: String
    public var title: String = ""
    public var description: String = ""
    public var price: Decimal = Decimal(0)
    internal(set) public var venue: Venue
    
    public init(id: String, venue: Venue?) {
        self.id = id
        self.venue = venue ?? Venue()
    }
    
    public convenience init(id: String) {
        self.init(id: id, venue: nil)
    }
    
}
