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
    
    let safeactionButton: UIButton = {
            let button = UIButton(type: .system)
            let attributedTitle = NSMutableAttributedString(string: "Safe actions > ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: colors.aquavelvet])
            
            
            button.setAttributedTitle(attributedTitle, for: .normal)
      
            return button
        }()
    
    private let alluoneedlabel: UILabel = {
        let label = UILabel()
        label.text = "All you need is"
        label.font = UIFont(name: "Avenir-Light" , size: 19)
        label.textColor = .black
        
        return label
    }()
    
    private let stayhomelabel: UILabel = {
           let label = UILabel()
           label.text = "Stay at Home"
           label.font = UIFont(name: "Avenir-Light" , size: 20)
        label.font = UIFont.boldSystemFont(ofSize: 20)
           label.textColor = .black
           
           return label
       }()
    
    let notificationBellview = UIView()
    let notificationTextview = UIView()
    let notificationArrowview = UIView()
    let notificationBellImage = UIImageView(image: #imageLiteral(resourceName: "notificationbell"))



    
    // MARK: - Lifecycale
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
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
        view.backgroundColor = .white //colors.silver
        
        let buttonControlStack = UIStackView(arrangedSubviews: [HomeButton, plusButton ,settingButton])
        
        view.addSubview(buttonControlStack)
        buttonControlStack.heightAnchor.constraint(equalToConstant: 60).isActive = true
        buttonControlStack.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor , right: view.rightAnchor, paddingLeft: 10, paddingRight: 20)
        buttonControlStack.distribution = .fillEqually
        
        view.addSubview(homepicview)
        homepicview.translatesAutoresizingMaskIntoConstraints = false
        homepicview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        homepicview.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        homepicview.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.5).isActive = true
        homepicview.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.2).isActive = true

        

        view.addSubview(safeactionview)
        safeactionview.translatesAutoresizingMaskIntoConstraints = false
               safeactionview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
               safeactionview.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -5).isActive = true
               safeactionview.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.5).isActive = true
               safeactionview.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.2).isActive = true

   
        view.addSubview(notificationBellview)
        notificationBellview.translatesAutoresizingMaskIntoConstraints = false
                      notificationBellview.topAnchor.constraint(equalTo: homepicview.bottomAnchor, constant: 10).isActive = true
                      notificationBellview.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
                      notificationBellview.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3).isActive = true
                      notificationBellview.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true

        
       homepicview.addSubview(homepic)
        homepic.translatesAutoresizingMaskIntoConstraints = false

        homepic.topAnchor.constraint(equalTo: homepicview.topAnchor).isActive = true
        homepic.leadingAnchor.constraint(equalTo: homepicview.leadingAnchor).isActive = true
        homepic.trailingAnchor.constraint(equalTo: homepicview.trailingAnchor).isActive = true
        homepic.bottomAnchor.constraint(equalTo: homepicview.bottomAnchor).isActive = true

       
        
 
       safeactionview.addSubview(alluoneedlabel)
        alluoneedlabel.translatesAutoresizingMaskIntoConstraints = false

        alluoneedlabel.topAnchor.constraint(equalTo: safeactionview.topAnchor,constant: 45).isActive = true
               alluoneedlabel.leadingAnchor.constraint(equalTo: safeactionview.leadingAnchor, constant: 25).isActive = true

        safeactionview.addSubview(stayhomelabel)
        stayhomelabel.translatesAutoresizingMaskIntoConstraints = false

        stayhomelabel.topAnchor.constraint(equalTo: alluoneedlabel.topAnchor,constant: 20).isActive = true
               stayhomelabel.leadingAnchor.constraint(equalTo: safeactionview.leadingAnchor, constant: 25).isActive = true


        safeactionview.addSubview(safeactionButton)
        safeactionButton.translatesAutoresizingMaskIntoConstraints = false

        safeactionButton.topAnchor.constraint(equalTo: stayhomelabel.topAnchor,constant: 20).isActive = true
                      safeactionButton.leadingAnchor.constraint(equalTo: safeactionview.leadingAnchor, constant: 25).isActive = true

        notificationTextview.backgroundColor  = .blue
        view.addSubview(notificationTextview)
        notificationTextview.translatesAutoresizingMaskIntoConstraints = false
        notificationTextview.topAnchor.constraint(equalTo: homepicview.bottomAnchor, constant: 10).isActive = true
        notificationTextview.leadingAnchor.constraint(equalTo: notificationBellview.trailingAnchor, constant: 5).isActive = true
        notificationTextview.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.5).isActive = true
        notificationTextview.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        
       
            
        notificationArrowview.backgroundColor = .green
        view.addSubview(notificationArrowview)
        notificationArrowview.translatesAutoresizingMaskIntoConstraints = false
        notificationArrowview.topAnchor.constraint(equalTo: homepicview.bottomAnchor, constant: 10).isActive = true
        notificationArrowview.leadingAnchor.constraint(equalTo: notificationTextview.trailingAnchor, constant: 5).isActive = true
        notificationArrowview.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.2).isActive = true
        notificationArrowview.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        notificationArrowview.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -2).isActive = true
        
        notificationBellview.addSubview(notificationBellImage)
         notificationBellImage.translatesAutoresizingMaskIntoConstraints = false

         notificationBellImage.topAnchor.constraint(equalTo: notificationBellview.topAnchor, constant: 15).isActive = true
         notificationBellImage.leadingAnchor.constraint(equalTo: notificationBellview.leadingAnchor, constant: 5).isActive = true
         notificationBellImage.trailingAnchor.constraint(equalTo: notificationBellview.trailingAnchor, constant: -5).isActive = true
         notificationBellImage.bottomAnchor.constraint(equalTo: notificationBellview.bottomAnchor).isActive = true


         navigationController?.navigationBar.isHidden = true
            }
    
}
