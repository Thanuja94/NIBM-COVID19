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
    
    private let createLable: UILabel = {
        let label = UILabel()
        label.text = "CREATE +"
        label.font = UIFont(name: "Avenir-Light" , size: 25)
        label.textColor = .black
        
        return label
    }()
    
    let closeButton: UIButton = {
               let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "close", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
               
        button.tintColor = .black
               
               button.setAttributedTitle(attributedTitle, for: .normal)
         
               return button
           }()
    
    private let createNotificationLable: UILabel = {
        let label = UILabel()
        label.text = "Create Notifications"
        label.font = UIFont(name: "Avenir-Light" , size: 20)
        label.textColor = .black
        
        return label
    }()
    
    let notificationArrowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = .black
        return button
    }()

    private let createSurvayLable: UILabel = {
           let label = UILabel()
           label.text = "New Survay"
           label.font = UIFont(name: "Avenir-Light" , size: 20)
           label.textColor = .black
           
           return label
       }()
    
    let survayArrowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = .black
        return button
    }()
    // MARK: - Lifecycale
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        
    }
    
    // MARK: - Functions
    
    
    func setupUI()    {
        
        view.backgroundColor = .white
        
        view.addSubview(titleLableView)
        titleLableView.translatesAutoresizingMaskIntoConstraints = false
        titleLableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        titleLableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        titleLableView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.5).isActive = true
        titleLableView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.08).isActive = true
        

        view.addSubview(closeButtonView)
        closeButtonView.translatesAutoresizingMaskIntoConstraints = false
        closeButtonView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        closeButtonView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -5).isActive = true
        closeButtonView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4).isActive = true
        closeButtonView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.08).isActive = true
        
        view.addSubview(notificationLabelView)
        notificationLabelView.translatesAutoresizingMaskIntoConstraints = false
        notificationLabelView.topAnchor.constraint(equalTo: titleLableView.bottomAnchor, constant: 10).isActive = true
        notificationLabelView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        notificationLabelView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6).isActive = true
        notificationLabelView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.09).isActive = true
        
        
        view.addSubview(notificationButtonView)
        notificationButtonView.translatesAutoresizingMaskIntoConstraints = false
        notificationButtonView.topAnchor.constraint(equalTo: titleLableView.bottomAnchor, constant: 10).isActive = true
        notificationButtonView.leadingAnchor.constraint(equalTo: notificationLabelView.trailingAnchor, constant: 5).isActive = true
        notificationButtonView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3).isActive = true
        notificationButtonView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.09).isActive = true
        notificationButtonView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor , constant: -5).isActive = true
        
       
        view.addSubview(survayLabelView)
        survayLabelView.translatesAutoresizingMaskIntoConstraints = false
        survayLabelView.topAnchor.constraint(equalTo: notificationLabelView.bottomAnchor, constant: 10).isActive = true
        survayLabelView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        survayLabelView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6).isActive = true
        survayLabelView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.09).isActive = true
        
       
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
        
        
        titleLableView.addSubview(createLable)
         createLable.translatesAutoresizingMaskIntoConstraints = false
         createLable.topAnchor.constraint(equalTo: titleLableView.topAnchor, constant: 15).isActive = true
         createLable.heightAnchor.constraint(equalTo: titleLableView.heightAnchor, multiplier: 0.5).isActive = true
         createLable.centerXAnchor.constraint(equalTo: titleLableView.centerXAnchor).isActive = true

         closeButtonView.addSubview(closeButton)
         closeButton.translatesAutoresizingMaskIntoConstraints = false
         closeButton.topAnchor.constraint(equalTo: closeButtonView.topAnchor, constant: 15).isActive = true
         closeButton.heightAnchor.constraint(equalTo: closeButtonView.heightAnchor, multiplier: 0.3).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: closeButtonView.trailingAnchor, constant: -5).isActive = true
        
         notificationLabelView.addSubview(createNotificationLable)
         createNotificationLable.translatesAutoresizingMaskIntoConstraints = false
         createNotificationLable.heightAnchor.constraint(equalTo: notificationLabelView.heightAnchor, multiplier: 0.3).isActive = true
        createNotificationLable.leadingAnchor.constraint(equalTo: notificationLabelView.leadingAnchor, constant: 5).isActive = true
        createNotificationLable.centerYAnchor.constraint(equalTo: notificationLabelView.centerYAnchor).isActive = true

         notificationButtonView.addSubview(notificationArrowButton)
          notificationArrowButton.translatesAutoresizingMaskIntoConstraints = false
          notificationArrowButton.heightAnchor.constraint(equalTo: notificationButtonView.heightAnchor, multiplier: 0.3).isActive = true
         notificationArrowButton.trailingAnchor.constraint(equalTo: notificationButtonView.trailingAnchor, constant: -15).isActive = true
         notificationArrowButton.centerYAnchor.constraint(equalTo: notificationButtonView.centerYAnchor).isActive = true

        survayLabelView.addSubview(createSurvayLable)
                createSurvayLable.translatesAutoresizingMaskIntoConstraints = false
                createSurvayLable.heightAnchor.constraint(equalTo: survayLabelView.heightAnchor, multiplier: 0.3).isActive = true
               createSurvayLable.leadingAnchor.constraint(equalTo: survayLabelView.leadingAnchor, constant: 5).isActive = true
               createSurvayLable.centerYAnchor.constraint(equalTo: survayLabelView.centerYAnchor).isActive = true

          
        survayButtonView.addSubview(survayArrowButton)
         survayArrowButton.translatesAutoresizingMaskIntoConstraints = false
         survayArrowButton.heightAnchor.constraint(equalTo: survayButtonView.heightAnchor, multiplier: 0.3).isActive = true
        survayArrowButton.trailingAnchor.constraint(equalTo: survayButtonView.trailingAnchor, constant: -15).isActive = true
        survayArrowButton.centerYAnchor.constraint(equalTo: survayButtonView.centerYAnchor).isActive = true


        
        
        navigationController?.navigationBar.isHidden = true
        
        
    }
}
