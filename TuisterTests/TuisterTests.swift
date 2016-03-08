//
//  TuisterTests.swift
//  TuisterTests
//
//  Created by Pablo Bendersky on 1/11/16.
//  Copyright © 2016 Pablo Bendersky. All rights reserved.
//

import XCTest
@testable import Tuister

class TuisterTests: XCTestCase {
    
    private var tuister: Tuister!
    
    override func setUp() {
        super.setUp()
        
        self.tuister = Tuister()
    }
    
    func testQuery() {
        let account = self.tuister.firstAccount()
        
        let expectation = expectationWithDescription("Tuister completion handler")
        
        self.tuister.search(account!, term: "@nsconfarg") { (_: [Tweet]) -> Void in
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10, handler: nil)
    }
    
}
