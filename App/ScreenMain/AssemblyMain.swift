//
//  Assembly.swift
//  1
//
//  Created by Sasha on 27.06.2024.
//

import Foundation
import UIKit

enum AssemblyMain {
    static func makeModule() -> UIViewController {
        let presenter = PresenterMain(service: ServiceMain(delay: Constants.prodDataDelay))
        let vc = ViewControllerMain(output: presenter)
        presenter.view = vc

        return vc
    }
}

enum Constants {
    static let prodDataDelay: TimeInterval = 1.0
    static let storyBoardID: String = "ViewControllerID"

}
