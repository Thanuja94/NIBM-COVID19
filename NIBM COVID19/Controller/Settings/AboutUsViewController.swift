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

 // MARK: - Lifecycale
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
      
    }
    
    // MARK: - Functions

    func setupUI()  {
        view.backgroundColor = .brown
    }
    
}
