//
//  SignUpViewController.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/6/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - Properties
    
    let imageviewVirus = UIImageView(image:#imageLiteral(resourceName: "virus"))
    
    
    private let SignUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up with Email", for: .normal)
        button.setTitleColor(UIColor(white: 1, alpha: 1), for: .normal)
        button.backgroundColor = colors.cynaite
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        return button
    }()
    
    // MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(imageviewVirus)
        imageviewVirus.anchor(top: view.safeAreaLayoutGuide.topAnchor ,paddingTop: 200)
        imageviewVirus.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [SignUpButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: imageviewVirus.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 60, paddingLeft: 16, paddingRight: 16)
        
        navigationController?.navigationBar.isHidden = true
        
    }
    
    
    // MARK: - Fuctions
}
