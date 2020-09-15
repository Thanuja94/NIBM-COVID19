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
    

    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "profile"
        
        setupUI()
        
        
    }
    
    // MARK: - functions
    
    func setupUI() {
        
        view.backgroundColor = .white
        
        profileNameView.backgroundColor = .red
        view.addSubview(profileNameView)
        profileNameView.translatesAutoresizingMaskIntoConstraints = false
        profileNameView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 35).isActive = true
        profileNameView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        profileNameView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        profileNameView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -5).isActive = true
        
        profilePicView.backgroundColor = .green
        view.addSubview(profilePicView)
        profilePicView.translatesAutoresizingMaskIntoConstraints = false
        profilePicView.topAnchor.constraint(equalTo: profileNameView.bottomAnchor, constant: 15).isActive = true
        profilePicView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        profilePicView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.3).isActive = true
        profilePicView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -5).isActive = true
        navigationController?.navigationBar.isHidden = false
        
        
    }
    

    
}
