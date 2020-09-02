//
//  CreateAccViewController.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/2/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class CreateAccViewController: UIViewController {

    private let CreateAccLabel: UILabel = {
               let label = UILabel()
               label.text = "Create An Account"
               label.font = UIFont(name: "Avenir-Light" , size: 35)
               label.textColor = UIColor(white: 1, alpha: 0.8)
               
               return label
           }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = colors.silver
        
        view.addSubview(CreateAccLabel)
        CreateAccLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor )
        CreateAccLabel.centerX(inView: view)
    }
    

    

}
