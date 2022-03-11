//
//  ChantalUITests.swift
//  ChantalUITests
//
//  Created by kirill on 03.03.2022.
//  Copyright © 2022 Monte Thakkar. All rights reserved.
//

import XCTest

class ChantalUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }


    func testLaunch() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let chantalNavigationBar = app.navigationBars["Chantal"].firstMatch
        XCTAssert(chantalNavigationBar.waitForExistence(timeout: 5))
//XCTAssertFalse(chantalNavigationBar.waitForExistence(timeout: 5))

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testTaskAdd() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let chantalNavigationBar = app.navigationBars["Chantal"].firstMatch
        XCTAssert(chantalNavigationBar.waitForExistence(timeout: 5))

        let chantalButtonAdd = app.buttons["Add"].firstMatch
        chantalButtonAdd.tap()

        let allertTextField = app.alerts.textFields.firstMatch

        //app.alerts.textFields.containing(NSPredicate(format: "value CONTAINS[c] %@", "Enter task name")).firstMatch
        allertTextField.tap()
        allertTextField.typeText("test")

        app.alerts.buttons["Add"].tap()
        XCTAssert(app.staticTexts["test"].exists)
        //XCTAssertFalse(chantalNavigationBar.waitForExistence(timeout: 5))

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testTaskDone() {
        testTaskAdd()
        XCUIApplication().tables.staticTexts["test"].swipeRight()

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
