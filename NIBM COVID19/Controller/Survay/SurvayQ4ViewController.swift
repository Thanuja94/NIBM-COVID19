//
//  SurvayQ4ViewController.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/10/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class SurvayQ4ViewController: UIViewController {

    // MARK: - Properties
       
       let survayq4image = UIImageView(image: #imageLiteral(resourceName: "survayq4"))
       
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
             label.text = "Have you been been interact with any sick person recently?"
             label.font = UIFont(name: "Avenir-Light" , size: 25)
             label.textColor = .black//UIColor(white: 1, alpha: 0.8)
             label.numberOfLines = 0
             label.textAlignment = .center
            
             
             return label
         }()
    private let pageController:  UIPageControl = {
           let pc = UIPageControl()
           pc.numberOfPages = 4

           pc.currentPage = 3
           pc.currentPageIndicatorTintColor = colors.aquavelvet
           pc.pageIndicatorTintColor = .gray
           
           return pc
           
       }()

    
       // MARK: - Lifecycale
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUi()
    }
    
    func setupUi(){
        view.backgroundColor = colors.silver
        
        view.addSubview(YesButton)
        YesButton.anchor( left: view.leftAnchor,   bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingLeft: 40, paddingBottom: 50 )
        //YesButton.centerX(inView: view)
        
        view.addSubview(pageController)
        pageController.anchor(left: YesButton.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingLeft: 100)
        pageController.centerX(inView: view)

        
        view.addSubview(NoButton)
        NoButton.anchor( bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,  paddingBottom: 50, paddingRight: 40)
        
        view.addSubview(survayq4image)
        survayq4image.anchor(top: view.safeAreaLayoutGuide.topAnchor ,paddingTop: 100)
        survayq4image.centerX(inView: view)
        
        
        view.addSubview(Question)
        Question.anchor(top: survayq4image.bottomAnchor , left: view.leftAnchor ,right: view.rightAnchor , paddingTop: 20, paddingLeft:20 , paddingRight: 20 )
        Question.centerX(inView: view)
        
    
      navigationController?.navigationBar.isHidden = true
    }
    

    

}
