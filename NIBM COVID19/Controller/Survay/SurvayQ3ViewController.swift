//
//  SurvayQ3ViewController.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/10/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class SurvayQ3ViewController: UIViewController {

    // MARK: - Properties
    
    let syntomsimage = UIImageView(image: #imageLiteral(resourceName: "Image"))
    
    let YesButton: UIButton = {
              let button = UIButton(type: .system)
              let attributedTitle = NSMutableAttributedString(string: "Yes", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: colors.aquavelvet])
              
              //button.addTarget(self, action: #selector(loginview), for: .touchUpInside)
             
              
              button.setAttributedTitle(attributedTitle, for: .normal)
              return button
          }()
    
    let NoButton: UIButton = {
                 let button = UIButton(type: .system)
                 let attributedTitle = NSMutableAttributedString(string: "No", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: colors.aquavelvet])
                 
                 //button.addTarget(self, action: #selector(loginview), for: .touchUpInside)
                
                 
                 button.setAttributedTitle(attributedTitle, for: .normal)
                 return button
             }()
    
    private let Question: UILabel = {
          let label = UILabel()
          label.text = "Have you been travelling in between last 14 days?"
          label.font = UIFont(name: "Avenir-Light" , size: 25)
          label.textColor = .black//UIColor(white: 1, alpha: 0.8)
          label.numberOfLines = 0
          label.textAlignment = .center
         
          
          return label
      }()
    // MARK: - Lifecycale
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
}
