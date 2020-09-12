//
//  AboutUsViewController.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/13/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {
    
    // MARK: - Properties
    let titleLableView = UIView()
    
    private let aboutUsLable: UILabel = {
        let label = UILabel()
        label.text = "Contact Us/ About Us"
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
        
        titleLableView.addSubview(aboutUsLable)
               aboutUsLable.translatesAutoresizingMaskIntoConstraints = false
               aboutUsLable.heightAnchor.constraint(equalTo: titleLableView.heightAnchor, multiplier: 0.5).isActive = true
               aboutUsLable.topAnchor.constraint(equalTo: titleLableView.topAnchor, constant: 10).isActive = true
               aboutUsLable.centerXAnchor.constraint(equalTo: titleLableView.centerXAnchor).isActive = true
               
               titleLableView.addSubview(backArrowButton)
               backArrowButton.translatesAutoresizingMaskIntoConstraints = false
               backArrowButton.heightAnchor.constraint(equalTo: titleLableView.heightAnchor, multiplier: 0.5).isActive = true
               backArrowButton.topAnchor.constraint(equalTo: titleLableView.topAnchor, constant: 10).isActive = true
               backArrowButton.leadingAnchor.constraint(equalTo: titleLableView.leadingAnchor, constant: 10).isActive = true
                       
    }
    
    @objc func handleBack() {
        
         navigationController?.popViewController(animated: true)
    }
    
}
