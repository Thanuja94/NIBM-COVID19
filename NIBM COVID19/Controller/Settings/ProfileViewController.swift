//
//  ProfileViewController.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/13/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    // MARK: - Properties
    
    
    let profileNameView = UIView()
    
    let profilePicView = UIView()
    
    let profileDetailView = UIView()
    
    let profileNameTextView = UIView()
    
    let indexTextView = UIView()
    
    let countryTextView = UIView()
    
    let updateButtonView = UIView()
    
    let updateButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "UPDATE", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: colors.aquavelvet])
        
       // button.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    private let nameLable: UILabel = {
        let label = UILabel()
        label.text = "James Smith"
        label.font = UIFont(name: "Avenir-Light" , size: 25)
        label.textColor = .black
        
        return label
    }()

    private let nameTextFiled: UITextField = {
           let textfield = UITextField()
           textfield.borderStyle = .line
           textfield.textColor = .black
        textfield.placeholder = "Name"
           
           
           return textfield
           
       }()
    
    private let indexTextFiled: UITextField = {
              let textfield = UITextField()
              textfield.borderStyle = .line
              textfield.textColor = .black
           textfield.placeholder = "Index"
              
              
              return textfield
              
          }()


    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "profile"
        
        setupUI()
        
        
    }
    
    // MARK: - functions
    
    func setupUI() {
        
        view.backgroundColor = .white
        
        view.addSubview(profileNameView)
        profileNameView.translatesAutoresizingMaskIntoConstraints = false
        profileNameView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10).isActive = true
        profileNameView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        profileNameView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        profileNameView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -5).isActive = true
        
        profilePicView.backgroundColor = .green
        view.addSubview(profilePicView)
        profilePicView.translatesAutoresizingMaskIntoConstraints = false
        profilePicView.topAnchor.constraint(equalTo: profileNameView.bottomAnchor, constant: 5).isActive = true
        profilePicView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        profilePicView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.25).isActive = true
        profilePicView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -5).isActive = true
        
        profileDetailView.backgroundColor = .blue
        view.addSubview(profileDetailView)
        profileDetailView.translatesAutoresizingMaskIntoConstraints = false
        profileDetailView.topAnchor.constraint(equalTo: profilePicView.bottomAnchor, constant: 5).isActive = true
        profileDetailView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        profileDetailView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.15).isActive = true
        profileDetailView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -5).isActive = true
        
       
        view.addSubview(profileNameTextView)
        profileNameTextView.translatesAutoresizingMaskIntoConstraints = false
        profileNameTextView.topAnchor.constraint(equalTo: profileDetailView.bottomAnchor, constant: 10).isActive = true
        profileNameTextView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        profileNameTextView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        profileNameTextView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -5).isActive = true
        
        
               view.addSubview(indexTextView)
               indexTextView.translatesAutoresizingMaskIntoConstraints = false
               indexTextView.topAnchor.constraint(equalTo: profileNameTextView.bottomAnchor, constant: 5).isActive = true
               indexTextView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
               indexTextView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
               indexTextView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -5).isActive = true
        
        countryTextView.backgroundColor = .yellow
        view.addSubview(countryTextView)
        countryTextView.translatesAutoresizingMaskIntoConstraints = false
        countryTextView.topAnchor.constraint(equalTo: indexTextView.bottomAnchor, constant: 5).isActive = true
        countryTextView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        countryTextView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        countryTextView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -5).isActive = true
        
        
        view.addSubview(updateButtonView)
        updateButtonView.translatesAutoresizingMaskIntoConstraints = false
        updateButtonView.bottomAnchor.constraint(equalTo:  view.layoutMarginsGuide.bottomAnchor, constant: 10).isActive = true
        updateButtonView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        updateButtonView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1).isActive = true
        updateButtonView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        
        updateButtonView.addSubview(updateButton)
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.heightAnchor.constraint(equalTo: updateButtonView.heightAnchor, multiplier: 0.5).isActive = true
        updateButton.topAnchor.constraint(equalTo: updateButtonView.topAnchor, constant: 10).isActive = true
        updateButton.centerXAnchor.constraint(equalTo: updateButtonView.centerXAnchor).isActive = true

        profileNameView.addSubview(nameLable)
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        nameLable.heightAnchor.constraint(equalTo: profileNameView.heightAnchor, multiplier: 0.5).isActive = true
        nameLable.topAnchor.constraint(equalTo: profileNameView.topAnchor, constant: 10).isActive = true
        nameLable.centerXAnchor.constraint(equalTo: profileNameView.centerXAnchor).isActive = true
        nameLable.centerYAnchor.constraint(equalTo: profileNameView.centerYAnchor).isActive = true
        
        
        profileNameTextView.addSubview(nameTextFiled)
               nameTextFiled.translatesAutoresizingMaskIntoConstraints = false
               nameTextFiled.heightAnchor.constraint(equalTo: profileNameTextView.heightAnchor, multiplier: 0.8).isActive = true
               nameTextFiled.topAnchor.constraint(equalTo: profileNameTextView.topAnchor, constant: 10).isActive = true
        nameTextFiled.trailingAnchor.constraint(equalTo: profileNameTextView.trailingAnchor, constant: -10).isActive = true
        nameTextFiled.leadingAnchor.constraint(equalTo: profileNameTextView.leadingAnchor, constant: 10).isActive = true

        indexTextView.addSubview(indexTextFiled)
                      indexTextFiled.translatesAutoresizingMaskIntoConstraints = false
                      indexTextFiled.heightAnchor.constraint(equalTo: indexTextView.heightAnchor, multiplier: 0.8).isActive = true
                      indexTextFiled.topAnchor.constraint(equalTo: indexTextView.topAnchor, constant: 10).isActive = true
               indexTextFiled.trailingAnchor.constraint(equalTo: indexTextView.trailingAnchor, constant: -10).isActive = true
               indexTextFiled.leadingAnchor.constraint(equalTo: indexTextView.leadingAnchor, constant: 10).isActive = true

        
        
        navigationController?.navigationBar.isHidden = false
        
        
        
    }
    

    
}
