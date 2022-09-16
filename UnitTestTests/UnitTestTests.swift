//
//  UnitTestTests.swift
//  UnitTestTests
//
//  Created by Cheng-Hong on 2022/9/14.
//

import XCTest
@testable import UnitTest

class UnitTestTests: XCTestCase {

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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_CheckFormat_Success() throws {
        let state = test_CheckFormat()
        
        XCTAssertTrue(state == .success)
    }
    
    func test_CheckFormat_PasswordError() throws {
        let state = test_CheckFormat(password: "1234")
        
        XCTAssertTrue(state == .passwordError)
    }
    
    func test_CheckFormat_AccountEmpty() throws {
        let state = test_CheckFormat("")
        
        XCTAssertTrue(state == .accountEmpty)
    }
    
    func test_CheckFormat_PasswordEmpty() throws {
        let state = test_CheckFormat(password: "")
        
        XCTAssertTrue(state == .passwordEmpty)
    }
    
    private func test_CheckFormat(_ account: String = "123", password: String = "123") -> ContentViewModel.FormatState {
        let model = AccountData()
        model.account = account
        model.password = password
        
        let viewMdoel = ContentViewModel()
        
        return viewMdoel.checkFormat(input: .init(accountData: model)).state
    }
    
    private func test_CheckAccountIsEmpty() -> Bool {
        let model = AccountData()
        model.account = ""
        
        return model.account.isEmpty
    }
}
