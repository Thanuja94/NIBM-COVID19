//
//  SurvayQ1ViewController.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/8/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit



class SurvayQ1ViewController: UIViewController {
    
      // MARK: - Properties
    
    let syntomsimage = UIImageView(image: #imageLiteral(resourceName: "survayq1"))
    
    let YesButton: UIButton = {
              let button = UIButton(type: .system)
              let attributedTitle = NSMutableAttributedString(string: "Yes", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: colors.aquavelvet])
              
              button.addTarget(self, action: #selector(handleYes), for: .touchUpInside)
             
              
              button.setAttributedTitle(attributedTitle, for: .normal)
              return button
          }()
    
    let NoButton: UIButton = {
                 let button = UIButton(type: .system)
                 let attributedTitle = NSMutableAttributedString(string: "No", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: colors.aquavelvet])
                 
                 button.addTarget(self, action: #selector(handleNo), for: .touchUpInside)
                
                 
                 button.setAttributedTitle(attributedTitle, for: .normal)
                 return button
             }()
    
    private let Question: UILabel = {
          let label = UILabel()
          label.text = "Are you have any symptoms above?"
          label.font = UIFont(name: "Avenir-Light" , size: 25)
          label.textColor = .black//UIColor(white: 1, alpha: 0.8)
          label.numberOfLines = 0
          label.textAlignment = .center
         
          
          return label
      }()
    // MARK: - Lifecycale

   

    override func viewDidLoad() {
        super.viewDidLoad()
        
       setupUi()
        
       
        
    }
    
    // MARK: - Functions
    
    func setupUi(){
        view.backgroundColor = colors.silver
        
        view.addSubview(YesButton)
        YesButton.anchor( left: view.leftAnchor,   bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingLeft: 40, paddingBottom: 50 )
        //YesButton.centerX(inView: view)
        
        view.addSubview(NoButton)
        NoButton.anchor( bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,  paddingBottom: 50, paddingRight: 40)
        
        view.addSubview(syntomsimage)
        syntomsimage.anchor(top: view.safeAreaLayoutGuide.topAnchor ,paddingTop: 100)
        syntomsimage.centerX(inView: view)
        
        view.addSubview(Question)
        Question.anchor(top: syntomsimage.bottomAnchor , left: view.leftAnchor ,right: view.rightAnchor , paddingTop: 20, paddingLeft:20 , paddingRight: 20 )
        Question.centerX(inView: view)
         
        navigationController?.navigationBar.isHidden = true
        
    }

     @objc func handleYes() {
            let survayq2viewconntroller = SurvayQ2ViewController()
            navigationController?.pushViewController(survayq2viewconntroller, animated: true)
             
        }
    

    @objc func handleNo() {
               let survayq2viewconntroller = SurvayQ2ViewController()
               navigationController?.pushViewController(survayq2viewconntroller, animated: true)
                
           }
}
