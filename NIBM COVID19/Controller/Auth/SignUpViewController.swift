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
        
         button.addTarget(self, action: #selector(ShowCreateAcc), for: .touchUpInside)
        
        return button
    }()
    
    let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Already have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: colors.aquavelvet])
        
        button.addTarget(self, action: #selector(loginview), for: .touchUpInside)
       
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    private let BysigninLabel: UILabel = {
        let label = UILabel()
        label.text = "By signin up, you agree with the terms of services and privacy policy"
        label.font = UIFont(name: "Avenir-Light" , size: 15)
        label.textColor = .gray//UIColor(white: 1, alpha: 0.8)
        label.numberOfLines = 0
        label.textAlignment = .center
       
        
        return label
    }()
    
    // MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(imageviewVirus)
        imageviewVirus.anchor(top: view.safeAreaLayoutGuide.topAnchor ,paddingTop: 200)
        imageviewVirus.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [SignUpButton,alreadyHaveAccountButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: imageviewVirus.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 60, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(BysigninLabel)
        BysigninLabel.anchor( left: view.leftAnchor,   bottom: view.safeAreaLayoutGuide.bottomAnchor, right:view.rightAnchor,paddingLeft: 20, paddingBottom: 50 ,paddingRight: 20)
        BysigninLabel.centerX(inView: view)
        
        navigationController?.navigationBar.isHidden = true
        
    }
    
    
    // MARK: - Fuctions
    
    @objc func loginview() {
           let loginviewcontroller = LoginViewController()
           navigationController?.pushViewController(loginviewcontroller, animated: true)
       }

    @objc func ShowCreateAcc() {
         let createaccviewcontroller = CreateAccViewController()
         navigationController?.pushViewController(createaccviewcontroller, animated: true)
     }
}
