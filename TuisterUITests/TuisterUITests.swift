//
//  TuisterUITests.swift
//  TuisterUITests
//
//  Created by Pablo Bendersky on 1/11/16.
//  Copyright © 2016 Pablo Bendersky. All rights reserved.
//

import XCTest

class TuisterUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.

        let app = XCUIApplication()
        app.launchEnvironment = ["-UITesting": "true"]
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNavigateToDetail() {
        let tablesQuery = XCUIApplication().tables
        let label = tablesQuery.cells.elementBoundByIndex(0).descendantsMatchingType(.StaticText).elementBoundByIndex(2)
        
        let handle = label.label
        
        tablesQuery.cells.elementBoundByIndex(0).tap()
        
        let detailLabels = XCUIApplication().descendantsMatchingType(.StaticText)
        let handleInDetail = detailLabels.elementBoundByIndex(2).label
        
        XCTAssertEqual(handle, handleInDetail)
    }
    
    func testNavigateToDetail2() {
        let app = XCUIApplication()
        let label = app.tables.childrenMatchingType(.Cell).elementBoundByIndex(0).staticTexts["screenName"]
        
        let handle = label.label
        label.tap()
        
        let detailLabel = app.staticTexts["screenName"]
        let handleInDetail = detailLabel.label
        
        XCTAssertEqual(handle, handleInDetail)
    }
    
    func testTweetOrderInTable() {
        let app = XCUIApplication()
        let label = app.tables.childrenMatchingType(.Cell).elementBoundByIndex(0).staticTexts["screenName"]
        
        let handle = label.label
        
        XCTAssertEqual(handle, "maro_beta")
    }
    
}
