//
//  MaultaschenDomainAssemblyTests.swift
//  MaultaschenDomainTests
//
//  Created by Gregor Dschung on 31.03.19.
//  Copyright © 2019 Gregor Dschung. All rights reserved.
//

import XCTest
import Swinject
@testable import MaultaschenDomain

class MaultaschenDomainAssemblyTests: XCTestCase {
    
    private var sut: MaultaschenDomainAssembly!
    
    override func setUp() {
        super.setUp()
        sut = MaultaschenDomainAssembly()
    }

}
