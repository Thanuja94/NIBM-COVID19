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
    
        private let SignupLabel: UILabel = {
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
    
        private let emailTextFiled: UIView = {
              let emailtf = UITextField()
              emailtf.borderStyle = .none
              emailtf.font = UIFont.systemFont(ofSize: 16)
              emailtf.textColor = .white
              emailtf.keyboardAppearance = .dark
              emailtf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
              
              return emailtf
          }()
    // MARK: - LifeCycles

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
        
        view.addSubview(SignupLabel)
        SignupLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor )
        SignupLabel.centerX(inView: view)
        
        view.addSubview(emailContainerView)
        emailContainerView.anchor(top: SignupLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16, height: 50)
        
        //view.addSubview(emailTextFiled)
        //emailTextFiled.anchor(top: emailContainerView.bottomAnchor,)

    }
    

   // MARK: - Fuctions

}
