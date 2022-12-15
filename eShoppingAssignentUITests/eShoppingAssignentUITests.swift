//
//  eShoppingAssignentUITests.swift
//  eShoppingAssignentUITests
//
//  Created by Shriram Kadam on 11/12/22.
//

import XCTest

final class eShoppingAssignentUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testDetailView() throws {
        /// Tests if a card can be opened and if there's correct information inside

        let app = XCUIApplication()
        app.launch()
        app.scrollViews.otherElements.staticTexts["eShopping Assignment"].tap()

        let author = app.scrollViews.otherElements.staticTexts["Author: shriramkadam.3840@gmail.com"]
        let date = app.scrollViews.otherElements.staticTexts["11th Dec 2022"]

        XCTAssertTrue(author.exists)
        XCTAssertTrue(date.exists)
    }

    func testSwipeAndOpen() throws {
        /// Tests a sequence of swipes and then a card opening

        let app = XCUIApplication()
        app.launch()

        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.staticTexts["eShopping Assignment"].swipeUp()
        elementsQuery.staticTexts["SwiftUI eShopping Assignment"].tap()

        let author = app.scrollViews.otherElements.staticTexts["Author: shriramkadam.3840@gmail.com"]
        let date = app.scrollViews.otherElements.staticTexts["11th Dec 2022"]

        XCTAssertTrue(author.exists)
        XCTAssertTrue(date.exists)
    }

    func testCardOpenAndClose() throws {
        /// Tests the opening and then closing of a card

        let app = XCUIApplication()
        app.launch()

        app.scrollViews.otherElements.staticTexts["SwiftUI eShopping Assignment"].tap()
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .button)["x.circle.fill"].tap()

        let card = app.scrollViews.otherElements.staticTexts["SwiftUI eShopping Assignment by Shriram Kadam"]

        XCTAssertTrue(card.exists)

    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
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
