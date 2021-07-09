//
//  testingVC.swift
//  task2Tests
//
//  Created by Muna Abdelwahab on 3/22/21.
//

import XCTest
@testable import task2
class testingVC: XCTestCase {

    var controller:ViewController?
    let promise = XCTestExpectation(description: "api called succesfully")
    
    override func setUpWithError() throws {
        controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController
        controller?.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testTFOutlets(){
        XCTAssertNotNil(controller?.nameTF)
        XCTAssertNotNil(controller?.passwordTF)
    }
    
    func testProperties(){
        XCTAssertEqual(controller?.passwordTF.placeholder, "enter user password")
        XCTAssertEqual(controller?.nameTF.placeholder, "enter user Name")
    }
    
    func testTFDelegate(){
        XCTAssertNotNil(controller?.passwordTF.delegate)
        XCTAssertNotNil(controller?.nameTF.delegate)
    }

    func testApiMockClass() {
        let client = ApiMockClass()
        client.getApiData(urlString: "") { (json) in
            XCTAssertNotNil(json)
            self.promise.fulfill()
        }
        wait(for: [promise], timeout: 4)
    }
}
