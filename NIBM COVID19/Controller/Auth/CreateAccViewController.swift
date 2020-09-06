//
//  CreateAccViewController.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/2/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import Firebase

class CreateAccViewController: UIViewController {
    
    // MARK: - Properties
    
    private let CreateAccLabel: UILabel = {
        let label = UILabel()
        label.text = "Create An Account"
        label.font = UIFont(name: "Avenir-Light" , size: 35)
        label.textColor = UIColor(white: 1, alpha: 0.8)
        
        return label
    }()
    
    private let firstNameTextFiled: UITextField = {
        return UITextField().textField(withPlaceholder: "First Name", isSecureTextEntry: false)
    }()
    
    private let LastNameTextFiled: UITextField = {
        return UITextField().textField(withPlaceholder: "Last Name", isSecureTextEntry: false)
        
    }()
    
    private let emailTextFiled: UITextField = {
        return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
    }()
    
    private let roleTextFiled: UITextField = {
        return UITextField().textField(withPlaceholder: "Role", isSecureTextEntry: false)
    }()
    
    private let passwordTextFiled: UITextField = {
        return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
    }()
    
    
    private lazy var firstnameContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: firstNameTextFiled )
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var LastnameContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: LastNameTextFiled )
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var emailContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextFiled )
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var RoleContainerView: UIView = {
        let view = UIView().inputContainerView(image:#imageLiteral(resourceName: "ic_account_box_white_2x") , textField: roleTextFiled )
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextFiled )
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
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        
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
        button.addTarget(self, action: #selector(ShowLogin), for: .touchUpInside)
        
        return button
    }()
    // MARK: - LifeCycles
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    // MARK: - Fuctions
    
    func setupUI(){
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
    }
    
    @objc func ShowLogin() {
        let loginviewcontroller = LoginViewController()
        navigationController?.pushViewController(loginviewcontroller, animated: true)
    }
    
    @objc func handleSignUp(){
        guard let firstname = firstNameTextFiled.text else { return }
        guard let lastname = LastNameTextFiled.text else { return }
        guard let email = emailTextFiled.text else { return }
        guard let role = roleTextFiled.text else { return }
        
        guard let password = passwordTextFiled.text else { return }
        
       
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG: Faild to register user with error \(error)")
                return
            }
            
             guard let uid = result?.user.uid else { return }
            
            let values = [
                       "firstname": firstname,
                       "lastname": lastname,
                       "email": email,
                       "role": role,
                       
                       ] as [String : Any]
                   
            Database.database().reference().child("users").child(uid).updateChildValues(values) { (error, ref) in
                         print("DEBUG: Successfuly Registerd and save data..")
                     }
        }
        
    }
    
    
    
}
