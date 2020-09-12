//
//  SettingsViewController.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/13/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

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
        
        profileView.backgroundColor = .red
        view.addSubview(profileView)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.topAnchor.constraint(equalTo: titleLableView.bottomAnchor, constant: 10).isActive = true
        profileView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        profileView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1).isActive = true
        profileView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        
        aboutUsView.backgroundColor = .gray
        view.addSubview(aboutUsView)
        aboutUsView.translatesAutoresizingMaskIntoConstraints = false
        aboutUsView.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 10).isActive = true
        aboutUsView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        aboutUsView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1).isActive = true
        aboutUsView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        
        shareWithView.backgroundColor = .green
        view.addSubview(shareWithView)
        shareWithView.translatesAutoresizingMaskIntoConstraints = false
        shareWithView.topAnchor.constraint(equalTo: aboutUsView.bottomAnchor, constant: 10).isActive = true
        shareWithView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        shareWithView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1).isActive = true
        shareWithView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        
        logOutButtonView.backgroundColor = .orange
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
                
        navigationController?.navigationBar.isHidden = true

    }

   

}
