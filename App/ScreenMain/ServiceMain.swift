//
//  Service.swift
//  1
//
//  Created by Sasha on 27.06.2024.
//

import Foundation

protocol ServiceInterface {
    func getData(completion: @escaping (String) -> Void)
}

class ServiceMain: ServiceInterface {
    let delay: TimeInterval
    
    init(delay: TimeInterval) {
        self.delay = delay
    }
    
    func getData(completion: @escaping (String) -> Void) {
        print("Function: \(#function), line: \(#line)")
        DispatchQueue.main.asyncAfter(deadline: .now() + self.delay) {
            completion("hello world")
        }
    }
}
