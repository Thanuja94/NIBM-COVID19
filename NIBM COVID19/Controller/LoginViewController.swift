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
            let view = UIView()
            //view.backgroundColor = .red
            
            let imageView = UIImageView()
            imageView.image = #imageLiteral(resourceName: "ic_mail_outline_white_2x")
            imageView.alpha = 0.87
            view.addSubview(imageView)
            imageView.centerY(inView: view)
            imageView.anchor(left: view.leftAnchor, paddingLeft: 8, height: 30, width: 30 )
            
            view.addSubview(emailTextFiled)
            emailTextFiled.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
            
            let separatorView = UIView()
            separatorView.backgroundColor = .lightGray
            view.addSubview(separatorView)
            separatorView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, height: 0.75)
            
            
            return view
        }()
    
        private let emailTextFiled: UIView = {
              let emailtf = UITextField()
              emailtf.borderStyle = .none
              emailtf.font = UIFont.systemFont(ofSize: 30)
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
        
       

    }
    

   // MARK: - Fuctions

}
