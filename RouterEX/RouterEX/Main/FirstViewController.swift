//
//  FirstViewController.swift
//  RouterEX
//
//  Created by 정재인 on 2021/01/23.
//

import UIKit
import Then

class FirstViewController: UIViewController {
    let label = UILabel()
    let cyanButton = UIButton()
    let redButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }
    
    func attribute() {
        view.do {
            $0.backgroundColor = .white
        }
        cyanButton.do {
            $0.backgroundColor = .systemRed
            $0.addTarget(self, action: #selector(cyanButtonDidTap), for: .touchUpInside)
            $0.setTitle("버튼", for: .normal)
        }
        label.do {
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor.black.cgColor
            $0.textAlignment = .center
        }
    }
    
    func layout() {
        [ cyanButton, label ].forEach { view.addSubview($0) }
        
        cyanButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        label.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.bottomAnchor.constraint(equalTo: cyanButton.topAnchor, constant: -100).isActive = true
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 300).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
    
    @objc func cyanButtonDidTap() {
        let secondViewController = SecondViewController()
        secondViewController.firstViewController = self
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}

extension FirstViewController: FirstViewDelegate {
    func passData(text: String) {
        label.text = text
        
    }
}
