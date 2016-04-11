//
//  TuisterTests.swift
//  TuisterTests
//
//  Created by Pablo Bendersky on 1/11/16.
//  Copyright © 2016 Pablo Bendersky. All rights reserved.
//

import XCTest
@testable import Tuister

class TwitterTests: XCTestCase {
    
    private var tuister: Tuister!
    
    override func setUp() {
        super.setUp()
        
        self.tuister = Twitter()
    }
    
    func testQuery() {
        let account = self.tuister.firstAccount()
        
        let expectacion = expectationWithDescription("Tuister completion handler")
        
        self.tuister.search(account!, term: "@nsconfarg") { (_: [Tweet]) -> Void in
            expectacion.fulfill()
        }
        
        waitForExpectationsWithTimeout(10, handler: nil)
    }
    
}
