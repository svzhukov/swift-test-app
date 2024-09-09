//
//  ViewControllerMainTests.swift
//  1Tests
//
//  Created by Sasha on 08.09.2024.
//

import XCTest

final class PresenterMainTests: XCTestCase {
    
    final class ServiceStub: ServiceInterface {
        func getData(completion: @escaping (String) -> Void) {
            completion("test world")
        }
    }
    
    final class ViewSpy: ViewInput {
        private(set) var renderCalled = false
        private(set) var dataPassed: String?
        func render(with data: String) {
            renderCalled = true
            dataPassed = data
        }
    }

    func testDataUpdatesOnViewLoad() throws {
        // Given
        let serviceStub = ServiceStub()
        let viewSpy = ViewSpy()
        let sut = PresenterMain(service: serviceStub)
        sut.view = viewSpy
        
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssertEqual(viewSpy.renderCalled, true)
        XCTAssertEqual(viewSpy.dataPassed, "test world")
    }
}
