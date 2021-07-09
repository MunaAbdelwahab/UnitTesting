//
//  tastingTableVC.swift
//  task2Tests
//
//  Created by Muna Abdelwahab on 3/22/21.
//

import XCTest
@testable import task2
class tastingTableVC: XCTestCase {

    var controller : secondViewController?
        
    override func setUpWithError() throws {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(identifier: "secondViewController")
        controller?.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        controller = nil
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testTableViewDelegets() {
        XCTAssertNotNil(controller?.tableView.delegate)
        XCTAssertNotNil(controller?.tableView.dataSource)
    }
    
    func testNumberOfRows() {
        XCTAssertEqual(controller?.tableView.numberOfRows(inSection: 0), 5)
    }
    
    func testCellForRow() {
        guard let tableView = controller?.tableView else {
            XCTFail("table view doesn't exist")
            return
        }
        
        let cell = controller?.tableView.dataSource?.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(cell?.textLabel?.text, "Welcome")
                
    }
    
    func testDidSelectCell() {
        guard let tableView = controller?.tableView else {
            XCTFail("table view doesn't exist")
            return
        }
        controller?.tableView.delegate?.tableView?(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        let cell = controller?.tableView.dataSource?.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell!.accessoryType, .checkmark)
        XCTAssertTrue(((controller?.isSelected) != nil))
    }
}
