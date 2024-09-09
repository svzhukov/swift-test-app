//
//  ViewControllerMainTests.swift
//  1Tests
//
//  Created by Sasha on 08.09.2024.
//

import XCTest

final class ViewControllerMainTests: XCTestCase {
    
    final class OutputStub: ViewOutput {
        
        weak var view: ViewInput?
        
        func viewDidLoad() {
            self.view?.render(with: "test world")
        }
    }
    
    func testViewControllerRendersLabelOnDidLoad() throws {
        // Given
        let outputStub = OutputStub()
        let sut = ViewControllerMain(output: outputStub)
        outputStub.view = sut
        
        // When
        sut.loadViewIfNeeded()
        
        // Then
        XCTAssertEqual(sut.titleLabel.text, "test world")
    }
}
