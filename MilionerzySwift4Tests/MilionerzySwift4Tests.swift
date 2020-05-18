//
//  MilionerzySwift4Tests.swift
//  MilionerzySwift4Tests
//
//  Created by LM88 on 12/05/2020.
//  Copyright © 2020 LM88. All rights reserved.
//

import XCTest
@testable import MilionerzySwift4

class MilionerzySwift4Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    
    }
    func testJSON(){
        XCTAssertFalse(Menager.getQuestions().isEmpty)
        XCTAssertFalse(Menager.getQuestions().count==0)
        
    }
   

}
