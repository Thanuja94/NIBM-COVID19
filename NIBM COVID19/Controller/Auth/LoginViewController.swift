//
//  LoginViewController.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 8/30/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import FirebaseAuth
import LocalAuthentication

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
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextFiled )
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextFiled )
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let emailTextFiled: UITextField = {
        return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
    }()
    
    private let passwordTextFiled: UITextField = {
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
        button.addTarget(self, action: #selector(handlesignin), for: .touchUpInside)
        
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
        
        setupUI()
        
    }
    
    
    // MARK: - Fuctions
    
    @objc func handlesignin() {
        //        guard let email = emailTextFiled.text else { return }
        //        guard let password = passwordTextFiled.text else { return }
        //
        //        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
        //            if let error = error {
        //                print("DEBUG: Faild to login user with error \(error.localizedDescription)")
        //                return
        //            }
        //
        //            //  guard let uid = result?.user.uid else { return }
        //            print("DEBUG: Login Successful..")
        ////            self.dismiss(animated: true, completion: nil)
        //
        //        }
        ////        let nav = UINavigationController(rootViewController: HomeViewController())
        ////                   nav.modalPresentationStyle = .fullScreen
        ////                   self.present(nav, animated: true, completion: nil)
        ////
        //        Service.shared.currentUserID = Auth.auth().currentUser?.uid
        //        let homeViewController = HomeViewController()
        //   navigationController?.pushViewController(homeViewController, animated: true)
        
        guard let email = emailTextFiled.text else { return }
        guard let password = passwordTextFiled.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG: Faild to login user with error \(error.localizedDescription)")
                return
            }
            
            
            let context = LAContext()
            
            if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil){
                context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Message"){(good, error) in
                    
                    if(good){
                        
                                                        DispatchQueue.main.async {
                                                            Service.shared.currentUserID = Auth.auth().currentUser?.uid
                                                           let nav = UINavigationController(rootViewController: HomeViewController())
                                                                                    nav.modalPresentationStyle = .fullScreen
                                                                                    self.present(nav, animated: true, completion: nil)
                                                        }
//
//                        print("DEBUG: Login Successful..")
//                        //            self.dismiss(animated: true, completion: nil)
//                        Service.shared.currentUserID = Auth.auth().currentUser?.uid
//                        let nav = UINavigationController(rootViewController: HomeViewController())
//                        nav.modalPresentationStyle = .fullScreen
//                        self.present(nav, animated: true, completion: nil)
                        
                        
                    }else{
                        let ac = UIAlertController(title: "Authentication failed", message: "Invalid Face Id.", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "OK", style: .default))
                        self.present(ac, animated: true)                      }
                }
            }
            
            //  guard let uid = result?.user.uid else { return }
            
        }
        
    }
    
    @objc func ShowCreateAcc() {
        let createaccviewcontroller = CreateAccViewController()
        navigationController?.pushViewController(createaccviewcontroller, animated: true)
        //         navigationController?.popViewController(animated: true)
    }
    
    func setupUI(){
        
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
    
    
}
