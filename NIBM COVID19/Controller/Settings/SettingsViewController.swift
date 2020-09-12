//
//  SettingsViewController.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/13/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {
    
    // MARK: - Properties
    
    let titleLableView = UIView()
    
    let profileView = UIView()
    
    let aboutUsView = UIView()
    
    let shareWithView = UIView()
    
    let logOutButtonView = UIView()
    
    private let settingsLable: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.font = UIFont(name: "Avenir-Light" , size: 25)
        label.textColor = .black
        
        return label
    }()

    let backArrowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        return button
        
    }()
    
    private let profileLable: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.font = UIFont(name: "Avenir-Light" , size: 22)
        label.textColor = .black
        
        return label
    }()
    
    let profileArrowButton: UIButton = {
          let button = UIButton(type: .system)
          button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
          button.tintColor = .black
          return button
      }()

    private let aboutUsLable: UILabel = {
        let label = UILabel()
        label.text = "Contact Us/ About Us"
        label.font = UIFont(name: "Avenir-Light" , size: 22)
        label.textColor = .black
        
        return label
    }()
    
    let aboutUsArrowButton: UIButton = {
          let button = UIButton(type: .system)
          button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
          button.tintColor = .black
        button.addTarget(self, action: #selector(handleAboutUs), for: .touchUpInside)
          return button
      }()

    private let shareWithLabel: UILabel = {
        let label = UILabel()
        label.text = "Share with Friend"
        label.font = UIFont(name: "Avenir-Light" , size: 22)
        label.textColor = .black
        
        return label
    }()
    
    let shareWithArrowButton: UIButton = {
          let button = UIButton(type: .system)
          button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
          button.tintColor = .black
          return button
      }()
    let logOutButton: UIButton = {
           let button = UIButton(type: .system)
           let attributedTitle = NSMutableAttributedString(string: "LOGOUT", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: colors.aquavelvet])
           
           button.addTarget(self, action: #selector(signOut), for: .touchUpInside)
          
           
           button.setAttributedTitle(attributedTitle, for: .normal)
           return button
       }()
    
     // MARK: - Lifecycale
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    
    // MARK: - Functions
    
    func setupUI()  {
          view.backgroundColor = .white
        
        
        view.addSubview(titleLableView)
        titleLableView.translatesAutoresizingMaskIntoConstraints = false
        titleLableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        titleLableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        titleLableView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1).isActive = true
        titleLableView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        
       
        view.addSubview(profileView)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.topAnchor.constraint(equalTo: titleLableView.bottomAnchor, constant: 10).isActive = true
        profileView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        profileView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1).isActive = true
        profileView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        
        
        view.addSubview(aboutUsView)
        aboutUsView.translatesAutoresizingMaskIntoConstraints = false
        aboutUsView.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 10).isActive = true
        aboutUsView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        aboutUsView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1).isActive = true
        aboutUsView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        
        view.addSubview(shareWithView)
        shareWithView.translatesAutoresizingMaskIntoConstraints = false
        shareWithView.topAnchor.constraint(equalTo: aboutUsView.bottomAnchor, constant: 10).isActive = true
        shareWithView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        shareWithView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1).isActive = true
        shareWithView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        
        
               view.addSubview(logOutButtonView)
               logOutButtonView.translatesAutoresizingMaskIntoConstraints = false
               logOutButtonView.bottomAnchor.constraint(equalTo:  view.layoutMarginsGuide.bottomAnchor, constant: 10).isActive = true
               logOutButtonView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
               logOutButtonView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1).isActive = true
               logOutButtonView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        
        titleLableView.addSubview(settingsLable)
        settingsLable.translatesAutoresizingMaskIntoConstraints = false
        settingsLable.heightAnchor.constraint(equalTo: titleLableView.heightAnchor, multiplier: 0.5).isActive = true
        settingsLable.topAnchor.constraint(equalTo: titleLableView.topAnchor, constant: 10).isActive = true
        settingsLable.centerXAnchor.constraint(equalTo: titleLableView.centerXAnchor).isActive = true
        
        titleLableView.addSubview(backArrowButton)
        backArrowButton.translatesAutoresizingMaskIntoConstraints = false
        backArrowButton.heightAnchor.constraint(equalTo: titleLableView.heightAnchor, multiplier: 0.5).isActive = true
        backArrowButton.topAnchor.constraint(equalTo: titleLableView.topAnchor, constant: 10).isActive = true
        backArrowButton.leadingAnchor.constraint(equalTo: titleLableView.leadingAnchor, constant: 10).isActive = true
                
        profileView.addSubview(profileLable)
               profileLable.translatesAutoresizingMaskIntoConstraints = false
               profileLable.heightAnchor.constraint(equalTo: profileView.heightAnchor, multiplier: 0.5).isActive = true
               profileLable.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 10).isActive = true
               profileLable.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 10).isActive = true
        
        profileView.addSubview(profileArrowButton)
        profileArrowButton.translatesAutoresizingMaskIntoConstraints = false
        profileArrowButton.heightAnchor.constraint(equalTo: profileView.heightAnchor, multiplier: 0.5).isActive = true
        profileArrowButton.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 10).isActive = true
        profileArrowButton.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -10).isActive = true
        
        aboutUsView.addSubview(aboutUsLable)
                      aboutUsLable.translatesAutoresizingMaskIntoConstraints = false
                      aboutUsLable.heightAnchor.constraint(equalTo: aboutUsView.heightAnchor, multiplier: 0.5).isActive = true
                      aboutUsLable.topAnchor.constraint(equalTo: aboutUsView.topAnchor, constant: 10).isActive = true
                      aboutUsLable.leadingAnchor.constraint(equalTo: aboutUsView.leadingAnchor, constant: 10).isActive = true
               
               aboutUsView.addSubview(aboutUsArrowButton)
               aboutUsArrowButton.translatesAutoresizingMaskIntoConstraints = false
               aboutUsArrowButton.heightAnchor.constraint(equalTo: aboutUsView.heightAnchor, multiplier: 0.5).isActive = true
               aboutUsArrowButton.topAnchor.constraint(equalTo: aboutUsView.topAnchor, constant: 10).isActive = true
               aboutUsArrowButton.trailingAnchor.constraint(equalTo: aboutUsView.trailingAnchor, constant: -10).isActive = true
        
        shareWithView.addSubview(shareWithLabel)
               shareWithLabel.translatesAutoresizingMaskIntoConstraints = false
               shareWithLabel.heightAnchor.constraint(equalTo: shareWithView.heightAnchor, multiplier: 0.5).isActive = true
               shareWithLabel.topAnchor.constraint(equalTo: shareWithView.topAnchor, constant: 10).isActive = true
               shareWithLabel.leadingAnchor.constraint(equalTo: shareWithView.leadingAnchor, constant: 10).isActive = true
        
        shareWithView.addSubview(shareWithArrowButton)
        shareWithArrowButton.translatesAutoresizingMaskIntoConstraints = false
        shareWithArrowButton.heightAnchor.constraint(equalTo: shareWithView.heightAnchor, multiplier: 0.5).isActive = true
        shareWithArrowButton.topAnchor.constraint(equalTo: shareWithView.topAnchor, constant: 10).isActive = true
        shareWithArrowButton.trailingAnchor.constraint(equalTo: shareWithView.trailingAnchor, constant: -10).isActive = true
               
        logOutButtonView.addSubview(logOutButton)
              logOutButton.translatesAutoresizingMaskIntoConstraints = false
              logOutButton.heightAnchor.constraint(equalTo: logOutButtonView.heightAnchor, multiplier: 0.5).isActive = true
              logOutButton.topAnchor.constraint(equalTo: logOutButtonView.topAnchor, constant: 10).isActive = true
              logOutButton.centerXAnchor.constraint(equalTo: logOutButtonView.centerXAnchor).isActive = true
              
        navigationController?.navigationBar.isHidden = true

    }

    @objc func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: sign out error")
        }
    }
    
      @objc func handleBack() {
            
             navigationController?.popViewController(animated: true)
        }
    
    @objc func handleAboutUs() {
               let aboutUsViewController = AboutUsViewController()
               navigationController?.pushViewController(aboutUsViewController, animated: true)
                
           }
   
    

}
