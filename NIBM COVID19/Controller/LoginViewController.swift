//
//  LoginViewController.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 8/30/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    // MARK: - Properties
    
        private let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "Sign Up with Email"
            label.font = UIFont(name: "Avenir-Light" , size: 25)
            label.textColor = UIColor(white: 1, alpha: 0.8)
            
            return label
        }()
    
        private let emailContainerView: UIView = {
            let view = UIView()
            view.backgroundColor = .red
            
            return view
        }()
    // MARK: - LifeCycles

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
        
        view.addSubview(titleLabel)
         titleLabel.translatesAutoresizingMaskIntoConstraints = false
         titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        
        
        view.addSubview(emailContainerView)
        emailContainerView.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16, height: 50)

    }
    

   // MARK: - Fuctions

}
