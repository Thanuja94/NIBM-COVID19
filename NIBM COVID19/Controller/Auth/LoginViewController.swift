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
            label.font = UIFont(name: "Avenir-Light" , size: 35)
            label.textColor = UIColor(white: 1, alpha: 0.8)
            
            return label
        }()
    
        private lazy var emailContainerView: UIView = {
         let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextFiled as! UITextField)
            view.heightAnchor.constraint(equalToConstant: 50).isActive = true
            return view
        }()
    
    private lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextFiled as! UITextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
        private let emailTextFiled: UIView = {
              return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
          }()
    
        private let passwordTextFiled: UIView = {
            return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
        }()
    
    private let SigninButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Sign In", for: .normal)
        // button.font = UIFont(name: "Avenir-Light", size: 35) ?? <#default value#>
           button.setTitleColor(UIColor(white: 1, alpha: 1), for: .normal)
           button.backgroundColor = colors.cynaite
           button.layer.cornerRadius = 10
           button.heightAnchor.constraint(equalToConstant: 60).isActive = true
           
           return button
       }()

    private let NeedAccButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Need an Account?", for: .normal)
     // button.font = UIFont(name: "Avenir-Light", size: 35) ?? <#default value#>
        button.setTitleColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1), for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.addTarget(self, action: #selector(ShowCreateAcc), for: .touchUpInside)
        
        return button
    }()
    // MARK: - LifeCycles

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = colors.silver
        
        view.addSubview(SignupLabel)
        SignupLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor )
        SignupLabel.centerX(inView: view)
        

        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, SigninButton, NeedAccButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: SignupLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)
       
        navigationController?.navigationBar.isHidden = true
    }
    

   // MARK: - Fuctions
    
    @objc func ShowCreateAcc() {
        let createaccviewcontroller = CreateAccViewController()
        navigationController?.pushViewController(createaccviewcontroller, animated: true)
    }

}
