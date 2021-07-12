//
//  CanaryShopUITests.swift
//  CanaryShopUITests
//
//  Created by Jared Perez Vega on 5/7/21.
//

import XCTest

class CanaryShopUITests: XCTestCase {
    
    func testHomeScreen() throws {
        let app = XCUIApplication()
        app.launch()
        Thread.sleep(forTimeInterval: 2)
        XCTAssertTrue(app.otherElements["HomeView"].exists)
    }
    
    func testDetailScreen() throws {
        let app = XCUIApplication()
        app.launch()
        Thread.sleep(forTimeInterval: 2)
        app.tables.cells.element(boundBy: 0).buttons["PlusButtonBuy"].tap()
        app.buttons["BuyButtonId"].tap()
        Thread.sleep(forTimeInterval: 2)
        XCTAssertTrue(app.otherElements["DetailView"].exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
