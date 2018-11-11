//
//  NYTimesTests.swift
//  NYTimesTests
//
//  Created by Mohammed Wasimuddin on 09/11/18.
//  Copyright © 2018 Wasim. All rights reserved.
//

import XCTest
@testable import NYTimes

class NYTimesTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNewsService() {
        
        
        var statusSuccess:Bool = false
        var statusError: String?
        let expectation = self.expectation(description: "logged in succesfully")
        
        let service = NYTimesServices.shared
        
        service.fetchMostViewedNews(section:"Arts/", period: "1.json?") { (result) in
            
            switch result {
                
            case .success(let news):
                
                statusSuccess = true
                expectation.fulfill()
                print(news)
                
                break
            case .failure(let error):
                statusError = error.localizedDescription
                print(statusError ?? "")
                XCTFail()
                break
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertEqual(statusSuccess, true)
    }

    

}
