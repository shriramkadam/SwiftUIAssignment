//
//  eShoppingAssignentTests.swift
//  eShoppingAssignentTests
//
//  Created by Shriram Kadam on 11/12/22.
//

import XCTest
import Combine
@testable import eShoppingAssignent

final class eShoppingAssignentTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    // Mark:- Tests Welcome to Product
    func testWelcome() throws {
        let app = XCUIApplication()
        app.launch()
        let welcome = app.staticTexts["Product List"]
        XCTAssert(welcome.exists)
    }
    
    // Mark:- Tests ViewModel from product list
    func testViewModel() throws {
        
        let viewModel = ProductViewModel()
        let testNews = Product(title: "Diamond Label Shiraz", id: "23124", imageURL: "https://www.kasandbox.org/programming-images/avatars/starky-ultimate.png", price: [], brand: "Rosemount", ratingCount: 4.0, isAddToCartEnable: true, isInWishlist: true, totalReviewCount: 11)
       
        XCTAssertTrue(viewModel.results.isEmpty, "Product array is empty")
        XCTAssertTrue(((viewModel.results.first?.title) != nil), "Diamond Label Shiraz")
        XCTAssertTrue(viewModel.results.count == 0, "Product array is empty")
        XCTAssertTrue(((viewModel.results.first?.imageURL) != nil), "https://www.kasandbox.org/programming-images/avatars/starky-ultimate.png")
        XCTAssertTrue(((viewModel.results.first?.brand) != nil), "Rosemount")
    }
    
    // Mark:- Tests if the Network Manager can get data from the api

    func testNetworkManager() throws {
        let url = URL(string: "https://run.mocky.io/v3/2f06b453-8375-43cf-861a-06e95a951328")!
        let productRequest = ProductsRequest()
        var result: [Product] = []
        print(result)
        let productsResource = ProductsResource()
        productsResource.getAllProducts(productsRequest: productRequest) { (productApiResponse) in
            debugPrint("All Products data: \(String(describing: productApiResponse))")
            result = productApiResponse?.products ?? []
        }
        waitForExpectations(timeout: 5)
        XCTAssertTrue(!result.isEmpty, "NetworkManager published an empty array.")
    }
    
    // Mark:-Tests the computed properties of the data model
    func testModelComputedProperties() throws {
        let product: Product = Product(title: "Diamond Label Shiraz", id: "23124", imageURL: "https://www.kasandbox.org/programming-images/avatars/starky-ultimate.png", price: [], brand: "Rosemount", ratingCount: 4.0, isAddToCartEnable: true, isInWishlist: true, totalReviewCount: 11)

        let formatter = DateFormatter()
        formatter.dateFormat = "M/d/yyyy"
        let testDate = formatter.date(from: "12/14/2022")
        XCTAssertTrue(product.imageURL == "wed, Dec 14, '22", "Computed property 'testDate' returns wrong value")
        XCTAssertTrue(product.imageURL !=  "https://dummyimage.com/600", "Couldn't unwrap the image url")
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    

}
