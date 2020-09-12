//
//  UpdateViewController.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/12/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController {
    
    // MARK: - Properties
    let titleLableView = UIView()
    
    let closeButtonView = UIView()
    
    let notificationLabelView = UIView()
    
    let notificationButtonView = UIView()
    
    let survayLabelView = UIView()
      
    let survayButtonView = UIView()
    
    let tempUpdateView = UIView()


    // MARK: - Lifecycale

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
                
       
    }
    
    // MARK: - Functions
  

    func setupUI()    {
        
        view.backgroundColor = .white
        
        titleLableView.backgroundColor = .blue
        view.addSubview(titleLableView)
        titleLableView.translatesAutoresizingMaskIntoConstraints = false
        titleLableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        titleLableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        titleLableView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.5).isActive = true
        titleLableView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.08).isActive = true

        closeButtonView.backgroundColor = .red
        view.addSubview(closeButtonView)
        closeButtonView.translatesAutoresizingMaskIntoConstraints = false
        closeButtonView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        closeButtonView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -5).isActive = true
        closeButtonView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4).isActive = true
        closeButtonView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.08).isActive = true

        notificationLabelView.backgroundColor = .gray
        view.addSubview(notificationLabelView)
        notificationLabelView.translatesAutoresizingMaskIntoConstraints = false
        notificationLabelView.topAnchor.constraint(equalTo: titleLableView.bottomAnchor, constant: 10).isActive = true
        notificationLabelView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        notificationLabelView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6).isActive = true
        notificationLabelView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.09).isActive = true
        
        notificationButtonView.backgroundColor = .gray
        view.addSubview(notificationButtonView)
        notificationButtonView.translatesAutoresizingMaskIntoConstraints = false
        notificationButtonView.topAnchor.constraint(equalTo: titleLableView.bottomAnchor, constant: 10).isActive = true
        notificationButtonView.leadingAnchor.constraint(equalTo: notificationLabelView.trailingAnchor, constant: 5).isActive = true
        notificationButtonView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3).isActive = true
        notificationButtonView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.09).isActive = true
        notificationButtonView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor , constant: -5).isActive = true
        
        survayLabelView.backgroundColor = .orange
        view.addSubview(survayLabelView)
               survayLabelView.translatesAutoresizingMaskIntoConstraints = false
               survayLabelView.topAnchor.constraint(equalTo: notificationLabelView.bottomAnchor, constant: 10).isActive = true
               survayLabelView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
               survayLabelView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6).isActive = true
               survayLabelView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.09).isActive = true
               
               survayButtonView.backgroundColor = .orange
               view.addSubview(survayButtonView)
               survayButtonView.translatesAutoresizingMaskIntoConstraints = false
               survayButtonView.topAnchor.constraint(equalTo: notificationLabelView.bottomAnchor, constant: 10).isActive = true
               survayButtonView.leadingAnchor.constraint(equalTo: survayLabelView.trailingAnchor, constant: 5).isActive = true
               survayButtonView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3).isActive = true
               survayButtonView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.09).isActive = true
               survayButtonView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor , constant: -5).isActive = true

        
        tempUpdateView.backgroundColor = .green
        view.addSubview(tempUpdateView)
        tempUpdateView.translatesAutoresizingMaskIntoConstraints = false
        tempUpdateView.topAnchor.constraint(equalTo: survayLabelView.bottomAnchor, constant: 10).isActive = true
        tempUpdateView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        tempUpdateView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1).isActive = true
        tempUpdateView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.3).isActive = true
        tempUpdateView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor , constant: -7).isActive = true

        
        navigationController?.navigationBar.isHidden = true


    }
}
