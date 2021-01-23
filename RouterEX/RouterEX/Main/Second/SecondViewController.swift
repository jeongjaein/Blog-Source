//
//  SecondViewController.swift
//  RouterEX
//
//  Created by 정재인 on 2021/01/23.
//

import UIKit

protocol FirstViewDelegate {
    func passData(text: String)
}

class SecondViewController: UIViewController {
    let textField = UITextField()
    let completeButton = UIButton()
    var firstViewController: FirstViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }
    
    func attribute() {
        view.do {
            $0.backgroundColor = .white
        }
        textField.do {
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor.black.cgColor
        }
        completeButton.do {
            $0.backgroundColor = .systemRed
            $0.addTarget(self, action: #selector(completButtonDidTap), for: .touchUpInside)
            $0.setTitle("완료", for: .normal)
        }
    }
    
    @objc func completButtonDidTap() {
        firstViewController?.passData(text: textField.text!)
        navigationController?.popViewController(animated: true)
    }
    
    func layout() {
        [ textField, completeButton ].forEach { view.addSubview($0) }
        
        textField.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 200).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        completeButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 100).isActive = true
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
}
