//
//  ViewControllerMainTests.swift
//  1Tests
//
//  Created by Sasha on 08.09.2024.
//

import XCTest

final class ServiceMainTests: XCTestCase {
    
    func testDataCompletion() throws {
        // Given
        let sut = ServiceMain(delay: 1)
        var capturedData: String? = nil
        let expectation = XCTestExpectation(description: "async completed")
        
        // When
        sut.getData { data in
            capturedData = data
            expectation.fulfill()
        }

        // Then
        wait(for: [expectation], timeout: 2)
        XCTAssertEqual(capturedData, "hello world")
    }

}
