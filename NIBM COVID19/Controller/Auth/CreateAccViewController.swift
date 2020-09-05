//
//  CreateAccViewController.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/2/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class CreateAccViewController: UIViewController {

    // MARK: - Properties
    
    private let CreateAccLabel: UILabel = {
               let label = UILabel()
               label.text = "Create An Account"
               label.font = UIFont(name: "Avenir-Light" , size: 35)
               label.textColor = UIColor(white: 1, alpha: 0.8)
               
               return label
           }()
    
    private let firstNameTextFiled: UIView = {
                 return UITextField().textField(withPlaceholder: "First Name", isSecureTextEntry: false)
             }()
    
    private let LastNameTextFiled: UIView = {
        return UITextField().textField(withPlaceholder: "Last Name", isSecureTextEntry: false)
        
   }()
    
    private let emailTextFiled: UIView = {
                return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
            }()
    
    private let roleTextFiled: UIView = {
          return UITextField().textField(withPlaceholder: "Role", isSecureTextEntry: false)
      }()
    
    private let passwordTextFiled: UIView = {
        return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
    }()

    
    private lazy var firstnameContainerView: UIView = {
            let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: firstNameTextFiled as! UITextField)
               view.heightAnchor.constraint(equalToConstant: 50).isActive = true
               return view
           }()
    
    private lazy var LastnameContainerView: UIView = {
               let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: LastNameTextFiled as! UITextField)
                  view.heightAnchor.constraint(equalToConstant: 50).isActive = true
                  return view
              }()
    
    private lazy var emailContainerView: UIView = {
           let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextFiled as! UITextField)
              view.heightAnchor.constraint(equalToConstant: 50).isActive = true
              return view
          }()
    
    private lazy var RoleContainerView: UIView = {
               let view = UIView().inputContainerView(image:#imageLiteral(resourceName: "ic_account_box_white_2x") , textField: roleTextFiled as! UITextField)
                  view.heightAnchor.constraint(equalToConstant: 50).isActive = true
                  return view
              }()
    
    private lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextFiled as! UITextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let SignupButton: UIButton = {
              let button = UIButton(type: .system)
              button.setTitle("Sign Up", for: .normal)
           
              button.setTitleColor(UIColor(white: 1, alpha: 1), for: .normal)
              button.backgroundColor = colors.cynaite
              button.layer.cornerRadius = 10
              button.heightAnchor.constraint(equalToConstant: 60).isActive = true
              
              return button
          }()
    
    private let BysigninLabel: UILabel = {
        let label = UILabel()
        label.text = "By signin up, you agree with the terms of services and privacy policy"
        label.font = UIFont(name: "Avenir-Light" , size: 15)
        label.textColor = UIColor(white: 1, alpha: 0.8)
        label.numberOfLines = 0
        label.textAlignment = .center
       
        
        return label
    }()
    
    private let alreadyhaveButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Already have an Account?", for: .normal)
       
           button.setTitleColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1), for: .normal)
           button.backgroundColor = .gray
           button.layer.cornerRadius = 10
           button.heightAnchor.constraint(equalToConstant: 60).isActive = true
           
           return button
       }()
    // MARK: - LifeCycles

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = colors.silver
        
       
        view.addSubview(CreateAccLabel)
               CreateAccLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor )
               CreateAccLabel.centerX(inView: view)
        
     
        
        let stack = UIStackView(arrangedSubviews: [firstnameContainerView, LastnameContainerView, emailContainerView, RoleContainerView, passwordContainerView, SignupButton,BysigninLabel,alreadyhaveButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: CreateAccLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)
        
//        view.addSubview(BysigninLabel)
//        BysigninLabel.anchor(top: stack.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,paddingTop: 10, paddingLeft: 16, paddingRight: 16, height: 30)
//        BysigninLabel.centerX(inView: view)
//
//        view.addSubview(alreadyhaveButton)
//        alreadyhaveButton.anchor(top: BysigninLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,paddingTop: 10, paddingLeft: 16, paddingRight: 16)
//        alreadyhaveButton.centerX(inView: view)
    }
    
    // MARK: - Fuctions
    

}
