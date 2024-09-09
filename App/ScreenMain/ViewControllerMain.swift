//
//  ViewController.swift
//  1
//
//  Created by Sasha on 16.06.2024.
//

import UIKit

protocol ViewInput: AnyObject {
    func render(with data: String)
}

class ViewControllerMain: UIViewController {
    var titleLabel: UILabel!
    var output: ViewOutput!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("should be not used")
    }
    
    init(output: ViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Function: \(#function), line: \(#line)")
        self.drawLabel()
        self.output.viewDidLoad()
    }
    
    func drawLabel() {
        titleLabel = UILabel()
        view.addSubview(titleLabel)
        titleLabel.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        print("Function: \(#function), line: \(#line)")
    }
}

extension ViewControllerMain: ViewInput {
    func render(with data: String) {
        titleLabel.text = data
        print("Function: \(#function), line: \(#line)")
        print(titleLabel.text ?? "empty")
    }
}

extension ViewControllerMain {
    private func some() {}
}
