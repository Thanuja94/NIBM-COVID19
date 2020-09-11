//
//  HomeViewController.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/8/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
 
    // MARK: - Properties
    
    let HomeButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Home", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: colors.aquavelvet])
        
        //button.addTarget(self, action: #selector(loginview), for: .touchUpInside)
        
        button.setImage(UIImage(systemName: "house.fill"), for: .normal)
        button.alignImageAndTitleVertically(padding: 20)
        
        button.tintColor = colors.aquavelvet
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    let plusButton: UIButton = {
                          let button = UIButton(type: .system)
                          let attributedTitle = NSMutableAttributedString(string: "Update", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: colors.aquavelvet])
                          
                          //button.addTarget(self, action: #selector(loginview), for: .touchUpInside)
                         
                          button.setImage(UIImage(systemName: "plus"), for: .normal)
                                 button.alignImageAndTitleVertically(padding: 20)
                                 
                                 button.tintColor = colors.aquavelvet
                          button.setAttributedTitle(attributedTitle, for: .normal)
                          return button
                      }()
    
    let settingButton: UIButton = {
                          let button = UIButton(type: .system)
                          let attributedTitle = NSMutableAttributedString(string: "Settings", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: colors.aquavelvet])
                          
                          //button.addTarget(self, action: #selector(loginview), for: .touchUpInside)
                         
                          button.setImage(UIImage(systemName: "gear"), for: .normal)
                          button.alignImageAndTitleVertically(padding: 20)
                          
                          button.tintColor = colors.aquavelvet
                          button.setAttributedTitle(attributedTitle, for: .normal)
                          return button
                      }()
    
    let homepicview = UIView()
    let safeactionview = UIView()
    let homepic = UIImageView(image: #imageLiteral(resourceName: "homepic"))
    
    // MARK: - Lifecycale
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIsUserLoggedIn()
       setupUI()

    }
    
    // MARK: - Functions
    
    func checkIsUserLoggedIn() {
        if(Auth.auth().currentUser?.uid == nil) {
            DispatchQueue.main.async {
                           let navigation = UINavigationController(rootViewController: LoginViewController())
                            navigation.modalPresentationStyle = .fullScreen
                           self.present(navigation, animated: true, completion: nil)
                       }
        } else {
            print("DEBUG: User is logged in..")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: sign out error")
        }
    }

    func setupUI()   {
        view.backgroundColor = .white
        
        let buttonControlStack = UIStackView(arrangedSubviews: [HomeButton, plusButton ,settingButton])
        view.addSubview(buttonControlStack)
        buttonControlStack.heightAnchor.constraint(equalToConstant: 60).isActive = true
        buttonControlStack.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor , right: view.rightAnchor, paddingLeft: 10, paddingRight: 20)
        buttonControlStack.distribution = .fillEqually
        
        view.addSubview(homepicview)
        homepicview.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 20, height: 200, width: 200)
        
        safeactionview.backgroundColor = .green
        view.addSubview(safeactionview)
        safeactionview.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: homepicview.rightAnchor, paddingTop: 20, paddingLeft: 20, height: 200, width: 150)
        
        homepicview.addSubview(homepic)
        homepic.anchor(top: homepicview.topAnchor ,left: homepicview.leftAnchor, bottom: homepicview.bottomAnchor, right: homepicview.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: 5 )
        
        navigationController?.navigationBar.isHidden = true
    }
    
}
