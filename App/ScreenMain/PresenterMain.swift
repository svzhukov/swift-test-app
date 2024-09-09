//
//  Presenter.swift
//  1
//
//  Created by Sasha on 27.06.2024.
//

import Foundation

protocol ViewOutput {
    func viewDidLoad()
}

class PresenterMain {
    let service: ServiceInterface
    weak var view: ViewInput?
    
    init(service: ServiceInterface) {
        self.service = service
    }
    
    func updateView() {
        print("Function: \(#function), line: \(#line)")
        self.service.getData(completion: { [weak self] data in
            self?.view?.render(with: data)
        })
    }
}

extension PresenterMain: ViewOutput {
    func viewDidLoad() {
        self.updateView()
    }
}


