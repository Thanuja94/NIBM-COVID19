//
//  HomeViewController.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/8/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import FirebaseAuth
import MapKit

class HomeViewController: UIViewController {
 
    // MARK: - Properties
    
    let HomeButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Home", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: colors.aquavelvet])
        
        //button.addTarget(self, action: #selector(loginview), for: .touchUpInside)
        
        button.setImage(UIImage(systemName: "house.fill"), for: .normal)
        button.alignImageAndTitleVertically(padding: 20)
        
        button.tintColor = colors.aquavelvet
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    let plusButton: UIButton = {
                          let button = UIButton(type: .system)
                          let attributedTitle = NSMutableAttributedString(string: "Update", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: colors.aquavelvet])
                          
                          button.addTarget(self, action: #selector(handleUpdate), for: .touchUpInside)
                         
                          button.setImage(UIImage(systemName: "plus"), for: .normal)
                                 button.alignImageAndTitleVertically(padding: 20)
                                 
                                 button.tintColor = colors.aquavelvet
                          button.setAttributedTitle(attributedTitle, for: .normal)
                          return button
                      }()
    
    let settingButton: UIButton = {
                          let button = UIButton(type: .system)
                          let attributedTitle = NSMutableAttributedString(string: "Settings", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: colors.aquavelvet])
                          
                          button.addTarget(self, action: #selector(handleSetting), for: .touchUpInside)
                         
                          button.setImage(UIImage(systemName: "gear"), for: .normal)
                          button.alignImageAndTitleVertically(padding: 20)
                          
                          button.tintColor = colors.aquavelvet
                          button.setAttributedTitle(attributedTitle, for: .normal)
                          return button
                      }()
    
    let homepicview = UIView()
    
    let safeactionview = UIView()
    
    let homepic = UIImageView(image: #imageLiteral(resourceName: "homepic"))
    
    let safeactionButton: UIButton = {
            let button = UIButton(type: .system)
            let attributedTitle = NSMutableAttributedString(string: "Safe actions > ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: colors.aquavelvet])
            
            button.addTarget(self, action: #selector(showSafeActions), for: .touchUpInside)

        
            button.setAttributedTitle(attributedTitle, for: .normal)
      
            return button
        }()
    
    private let alluoneedlabel: UILabel = {
        let label = UILabel()
        label.text = "All you need is"
        label.font = UIFont(name: "Avenir-Light" , size: 19)
        label.textColor = .black
        
        return label
    }()
    
    private let stayhomelabel: UILabel = {
           let label = UILabel()
           label.text = "Stay at Home"
           label.font = UIFont(name: "Avenir-Light" , size: 20)
        label.font = UIFont.boldSystemFont(ofSize: 20)
           label.textColor = .black
           
           return label
       }()
    
    let notificationBellview = UIView()
    
    let notificationTextview = UIView()
    
    let notificationArrowview = UIView()
    
    let notificationBellImage = UIImageView(image: #imageLiteral(resourceName: "notificationbell"))
    
    
    private let notificationLabel: UILabel = {
           let label = UILabel()
           label.text = "NIBM is closed until further notice"
           label.font = UIFont(name: "Avenir-Light" , size: 15)
           label.textColor = .black
        label.numberOfLines = 0
           
           return label
       }()

    let notificationArrowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = .black
        
        button.addTarget(self, action: #selector(showNotifications), for: .touchUpInside)

        return button
    }()

    let caseUpdateTitleView = UIView()
    
    let seeMoreButtonView = UIView()
    
    let seeMoreButton: UIButton = {
               let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "See More >> ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: colors.cynaite])
               
               button.addTarget(self, action: #selector(showMap), for: .touchUpInside)

               button.setAttributedTitle(attributedTitle, for: .normal)
         
               return button
           }()
    
    private let caseUpdateLabel: UILabel = {
            let label = UILabel()
            label.text = "University Case Updates"
        label.font = UIFont(name: "Avenir-Light" , size: 15)
        label.font = UIFont.boldSystemFont(ofSize: 15)
            label.textColor = .black
         label.numberOfLines = 0
            
            return label
        }()
    
    private let caseUpdateTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "1 mins ago"
    label.font = UIFont(name: "Avenir-Light" , size: 12)
    
        label.textColor = .black
     label.numberOfLines = 0
        
        return label
    }()

    let infectedView = UIView()
    
    let deathsView = UIView()
    
    let recoveredView = UIView()
    
    let mapHomeView = UIView()
    
    let infectedSymbol = UIImageView(image: #imageLiteral(resourceName: "infectedWarning"))
    
    let deathSymbol = UIImageView(image: #imageLiteral(resourceName: "deathSymbol"))

    let recoveredSymbol = UIImageView(image: #imageLiteral(resourceName: "recoveredSymbol"))

    private let infectedLabel: UILabel = {
        let label = UILabel()
        label.text = "Infected"
    label.font = UIFont(name: "Avenir-Light" , size: 15)
    
        label.textColor = .black
     label.numberOfLines = 0
        
        return label
    }()
    
    private let infectedCount: UILabel = {
        let label = UILabel()
        label.text = "2"
    label.font = UIFont(name: "Avenir-Light" , size: 45)
    
        label.textColor = .black
     label.numberOfLines = 0
        
        return label
    }()
    
    private let deathLabel: UILabel = {
        let label = UILabel()
        label.text = "Deaths"
    label.font = UIFont(name: "Avenir-Light" , size: 15)
    
        label.textColor = .black
     label.numberOfLines = 0
        
        return label
    }()
    
    private let deathCount: UILabel = {
        let label = UILabel()
        label.text = "0"
    label.font = UIFont(name: "Avenir-Light" , size: 45)
    
        label.textColor = .black
     label.numberOfLines = 0
        
        return label
    }()
    
    private let reacoveredLabel: UILabel = {
        let label = UILabel()
        label.text = "Recovered"
    label.font = UIFont(name: "Avenir-Light" , size: 15)
    
        label.textColor = .black
     label.numberOfLines = 0
        
        return label
    }()
    
    private let recoveredCount: UILabel = {
        let label = UILabel()
        label.text = "1"
    label.font = UIFont(name: "Avenir-Light" , size: 45)
    
        label.textColor = .black
     label.numberOfLines = 0
        
        return label
    }()
    
    
    private let mapView = MKMapView()
    private let locationManager = LocationHandler.shared.locationManager

       // MARK: - Lifecycale
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
       setupUI()
        addMap()
        fetchUsers()
        
       
    }
    
    // MARK: - Functions
    
    func checkIsUserLoggedInSettings() {
        if(Auth.auth().currentUser?.uid == nil) {
            DispatchQueue.main.async {
                           let navigation = UINavigationController(rootViewController: LoginViewController())
                            navigation.modalPresentationStyle = .fullScreen
                           self.present(navigation, animated: true, completion: nil)
                       }
        } else {
            print("DEBUG: User is logged in..")
            let settingViewController = SettingsViewController()
                       navigationController?.pushViewController(settingViewController, animated: true)
        }
    }
    
    
    func checkIsUserLoggedInUpdate() {
        if( Service.shared.currentUserID == nil)
//          if(Auth.auth().currentUser?.uid == nil)
          {
           
            let loginViewController = LoginViewController()
            navigationController?.pushViewController(loginViewController, animated: true)
            
//
//              DispatchQueue.main.async {
//                             let navigation = UINavigationController(rootViewController: LoginViewController())
//                              navigation.modalPresentationStyle = .fullScreen
//                             self.present(navigation, animated: true, completion: nil)
//                         }
          } else {
             let updateViewController = UpdateViewController()
              navigationController?.pushViewController(updateViewController, animated: true)
          }
      }
    

    func setupUI()   {
        view.backgroundColor = .white //colors.silver
        
        let buttonControlStack = UIStackView(arrangedSubviews: [HomeButton, plusButton ,settingButton])
        
        view.addSubview(buttonControlStack)
        buttonControlStack.heightAnchor.constraint(equalToConstant: 60).isActive = true
        buttonControlStack.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor , right: view.rightAnchor, paddingLeft: 10, paddingRight: 20)
        buttonControlStack.distribution = .fillEqually
        
        view.addSubview(homepicview)
        homepicview.translatesAutoresizingMaskIntoConstraints = false
        homepicview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        homepicview.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        homepicview.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.5).isActive = true
        homepicview.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.2).isActive = true

        

        view.addSubview(safeactionview)
        safeactionview.translatesAutoresizingMaskIntoConstraints = false
               safeactionview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
               safeactionview.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -5).isActive = true
               safeactionview.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.5).isActive = true
               safeactionview.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.2).isActive = true

   
        view.addSubview(notificationBellview)
        notificationBellview.translatesAutoresizingMaskIntoConstraints = false
                      notificationBellview.topAnchor.constraint(equalTo: homepicview.bottomAnchor, constant: 10).isActive = true
                      notificationBellview.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
                      notificationBellview.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3).isActive = true
                      notificationBellview.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true

        
       homepicview.addSubview(homepic)
        homepic.translatesAutoresizingMaskIntoConstraints = false

        homepic.topAnchor.constraint(equalTo: homepicview.topAnchor).isActive = true
        homepic.leadingAnchor.constraint(equalTo: homepicview.leadingAnchor).isActive = true
        homepic.trailingAnchor.constraint(equalTo: homepicview.trailingAnchor).isActive = true
        homepic.bottomAnchor.constraint(equalTo: homepicview.bottomAnchor).isActive = true

       
        
 
       safeactionview.addSubview(alluoneedlabel)
        alluoneedlabel.translatesAutoresizingMaskIntoConstraints = false

        alluoneedlabel.topAnchor.constraint(equalTo: safeactionview.topAnchor,constant: 45).isActive = true
               alluoneedlabel.leadingAnchor.constraint(equalTo: safeactionview.leadingAnchor, constant: 25).isActive = true

        safeactionview.addSubview(stayhomelabel)
        stayhomelabel.translatesAutoresizingMaskIntoConstraints = false

        stayhomelabel.topAnchor.constraint(equalTo: alluoneedlabel.topAnchor,constant: 20).isActive = true
               stayhomelabel.leadingAnchor.constraint(equalTo: safeactionview.leadingAnchor, constant: 25).isActive = true


        safeactionview.addSubview(safeactionButton)
        safeactionButton.translatesAutoresizingMaskIntoConstraints = false

        safeactionButton.topAnchor.constraint(equalTo: stayhomelabel.topAnchor,constant: 20).isActive = true
                      safeactionButton.leadingAnchor.constraint(equalTo: safeactionview.leadingAnchor, constant: 25).isActive = true

        view.addSubview(notificationTextview)
        notificationTextview.translatesAutoresizingMaskIntoConstraints = false
        notificationTextview.topAnchor.constraint(equalTo: homepicview.bottomAnchor, constant: 10).isActive = true
        notificationTextview.leadingAnchor.constraint(equalTo: notificationBellview.trailingAnchor, constant: 5).isActive = true
        notificationTextview.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.5).isActive = true
        notificationTextview.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        
       
        view.addSubview(notificationArrowview)
        notificationArrowview.translatesAutoresizingMaskIntoConstraints = false
        notificationArrowview.topAnchor.constraint(equalTo: homepicview.bottomAnchor, constant: 10).isActive = true
        notificationArrowview.leadingAnchor.constraint(equalTo: notificationTextview.trailingAnchor, constant: 5).isActive = true
        notificationArrowview.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.2).isActive = true
        notificationArrowview.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        notificationArrowview.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -2).isActive = true
        
        notificationBellview.addSubview(notificationBellImage)
         notificationBellImage.translatesAutoresizingMaskIntoConstraints = false

         notificationBellImage.topAnchor.constraint(equalTo: notificationBellview.topAnchor, constant: 15).isActive = true
         notificationBellImage.leadingAnchor.constraint(equalTo: notificationBellview.leadingAnchor, constant: 5).isActive = true
         notificationBellImage.trailingAnchor.constraint(equalTo: notificationBellview.trailingAnchor, constant: -5).isActive = true
         notificationBellImage.bottomAnchor.constraint(equalTo: notificationBellview.bottomAnchor).isActive = true
        
        notificationTextview.addSubview(notificationLabel)
        notificationLabel.translatesAutoresizingMaskIntoConstraints = false
        notificationLabel.topAnchor.constraint(equalTo: notificationTextview.topAnchor, constant: 10).isActive = true
         notificationLabel.leadingAnchor.constraint(equalTo: notificationTextview.leadingAnchor, constant: 5).isActive = true
        notificationLabel.trailingAnchor.constraint(equalTo: notificationTextview.trailingAnchor, constant: -5).isActive = true

        notificationArrowview.addSubview(notificationArrowButton)
        notificationArrowButton.translatesAutoresizingMaskIntoConstraints = false
        notificationArrowButton.topAnchor.constraint(equalTo: notificationArrowview.topAnchor, constant: 12).isActive = true
         notificationArrowButton.leadingAnchor.constraint(equalTo: notificationArrowview.leadingAnchor, constant: 5).isActive = true
        notificationArrowButton.trailingAnchor.constraint(equalTo: notificationArrowview.trailingAnchor, constant: -5).isActive = true
         
        
        view.addSubview(caseUpdateTitleView)
        caseUpdateTitleView.translatesAutoresizingMaskIntoConstraints = false
        caseUpdateTitleView.topAnchor.constraint(equalTo: notificationBellview.bottomAnchor, constant: 10).isActive = true
        caseUpdateTitleView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        caseUpdateTitleView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6).isActive = true
        caseUpdateTitleView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.06).isActive = true
        
        
        view.addSubview(seeMoreButtonView)
        seeMoreButtonView.translatesAutoresizingMaskIntoConstraints = false
        seeMoreButtonView.topAnchor.constraint(equalTo: notificationBellview.bottomAnchor, constant: 10).isActive = true
        seeMoreButtonView.leadingAnchor.constraint(equalTo: caseUpdateTitleView.trailingAnchor, constant: 5).isActive = true
        seeMoreButtonView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4).isActive = true
        seeMoreButtonView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.06).isActive = true
        
        seeMoreButtonView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -5).isActive = true
        
        caseUpdateTitleView.addSubview(caseUpdateLabel)
        caseUpdateLabel.translatesAutoresizingMaskIntoConstraints = false
        caseUpdateLabel.topAnchor.constraint(equalTo: caseUpdateTitleView.topAnchor, constant: 10).isActive = true
         caseUpdateLabel.leadingAnchor.constraint(equalTo: caseUpdateTitleView.leadingAnchor, constant: 5).isActive = true
        caseUpdateLabel.trailingAnchor.constraint(equalTo: caseUpdateTitleView.trailingAnchor, constant: -5).isActive = true
         
        caseUpdateTitleView.addSubview(caseUpdateTimeLabel)
        caseUpdateTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        caseUpdateTimeLabel.topAnchor.constraint(equalTo: caseUpdateLabel.bottomAnchor, constant: 1).isActive = true
         caseUpdateTimeLabel.leadingAnchor.constraint(equalTo: caseUpdateTitleView.leadingAnchor, constant: 5).isActive = true
        caseUpdateTimeLabel.trailingAnchor.constraint(equalTo: caseUpdateTitleView.trailingAnchor, constant: -5).isActive = true
         
        seeMoreButtonView.addSubview(seeMoreButton)
        seeMoreButton.translatesAutoresizingMaskIntoConstraints = false
        seeMoreButton.topAnchor.constraint(equalTo: seeMoreButtonView.topAnchor, constant: 5).isActive = true
         seeMoreButton.leadingAnchor.constraint(equalTo: seeMoreButtonView.leadingAnchor, constant: 20).isActive = true
        seeMoreButton.trailingAnchor.constraint(equalTo: seeMoreButtonView.trailingAnchor, constant: -5).isActive = true

        view.addSubview(infectedView)
        infectedView.translatesAutoresizingMaskIntoConstraints = false
        infectedView.topAnchor.constraint(equalTo: caseUpdateTitleView.bottomAnchor, constant: 10).isActive = true
        infectedView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 7).isActive = true
        infectedView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3).isActive = true
        infectedView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.2).isActive = true

        view.addSubview(deathsView)
        deathsView.translatesAutoresizingMaskIntoConstraints = false
        deathsView.topAnchor.constraint(equalTo: caseUpdateTitleView.bottomAnchor, constant: 10).isActive = true
        deathsView.leadingAnchor.constraint(equalTo: infectedView.trailingAnchor, constant: 5).isActive = true
        deathsView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3).isActive = true
        deathsView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.2).isActive = true

        view.addSubview(recoveredView)
        recoveredView.translatesAutoresizingMaskIntoConstraints = false
        recoveredView.topAnchor.constraint(equalTo: caseUpdateTitleView.bottomAnchor, constant: 10).isActive = true
        recoveredView.leadingAnchor.constraint(equalTo: deathsView.trailingAnchor, constant: 5).isActive = true
        recoveredView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3).isActive = true
        recoveredView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.2).isActive = true
        
        
        view.addSubview(mapHomeView)
        mapHomeView.translatesAutoresizingMaskIntoConstraints = false
        mapHomeView.topAnchor.constraint(equalTo: deathsView.bottomAnchor, constant: 10).isActive = true
        mapHomeView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        mapHomeView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1).isActive = true
        mapHomeView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.25).isActive = true
        mapHomeView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -5).isActive = true

        infectedView.addSubview(infectedSymbol)
        infectedSymbol.translatesAutoresizingMaskIntoConstraints = false
        infectedSymbol.topAnchor.constraint(equalTo: infectedView.topAnchor, constant: 15).isActive = true
        infectedSymbol.widthAnchor.constraint(equalTo: infectedView.widthAnchor, multiplier: 0.3).isActive = true
        infectedSymbol.heightAnchor.constraint(equalTo: infectedView.heightAnchor, multiplier: 0.25).isActive = true
        infectedSymbol.centerXAnchor.constraint(equalTo: infectedView.centerXAnchor).isActive = true
        
        deathsView.addSubview(deathSymbol)
        deathSymbol.translatesAutoresizingMaskIntoConstraints = false
        deathSymbol.topAnchor.constraint(equalTo: deathsView.topAnchor, constant: 15).isActive = true
        deathSymbol.widthAnchor.constraint(equalTo: deathsView.widthAnchor, multiplier: 0.3).isActive = true
        deathSymbol.heightAnchor.constraint(equalTo: deathsView.heightAnchor, multiplier: 0.25).isActive = true
        deathSymbol.centerXAnchor.constraint(equalTo: deathsView.centerXAnchor).isActive = true

        recoveredView.addSubview(recoveredSymbol)
        recoveredSymbol.translatesAutoresizingMaskIntoConstraints = false
        recoveredSymbol.topAnchor.constraint(equalTo: recoveredView.topAnchor, constant: 15).isActive = true
        recoveredSymbol.widthAnchor.constraint(equalTo: recoveredView.widthAnchor, multiplier: 0.3).isActive = true
        recoveredSymbol.heightAnchor.constraint(equalTo: recoveredView.heightAnchor, multiplier: 0.25).isActive = true
        recoveredSymbol.centerXAnchor.constraint(equalTo: recoveredView.centerXAnchor).isActive = true
               
        infectedView.addSubview(infectedCount)
        infectedCount.translatesAutoresizingMaskIntoConstraints = false
        infectedCount.topAnchor.constraint(equalTo: infectedSymbol.bottomAnchor, constant: 15).isActive = true
        infectedCount.widthAnchor.constraint(equalTo: infectedView.widthAnchor, multiplier: 0.3).isActive = true
        infectedCount.heightAnchor.constraint(equalTo: infectedView.heightAnchor, multiplier: 0.3).isActive = true
        infectedCount.centerXAnchor.constraint(equalTo: infectedView.centerXAnchor).isActive = true
        
        infectedView.addSubview(infectedLabel)
        infectedLabel.translatesAutoresizingMaskIntoConstraints = false
        infectedLabel.topAnchor.constraint(equalTo: infectedCount.bottomAnchor, constant: 1).isActive = true
        infectedLabel.heightAnchor.constraint(equalTo: infectedView.heightAnchor, multiplier: 0.2).isActive = true
        infectedLabel.centerXAnchor.constraint(equalTo: infectedView.centerXAnchor).isActive = true
        
        deathsView.addSubview(deathCount)
        deathCount.translatesAutoresizingMaskIntoConstraints = false
        deathCount.topAnchor.constraint(equalTo: deathSymbol.bottomAnchor, constant: 15).isActive = true
        deathCount.widthAnchor.constraint(equalTo: deathsView.widthAnchor, multiplier: 0.3).isActive = true
        deathCount.heightAnchor.constraint(equalTo: deathsView.heightAnchor, multiplier: 0.3).isActive = true
        deathCount.centerXAnchor.constraint(equalTo: deathsView.centerXAnchor).isActive = true
        
        deathsView.addSubview(deathLabel)
        deathLabel.translatesAutoresizingMaskIntoConstraints = false
        deathLabel.topAnchor.constraint(equalTo: deathCount.bottomAnchor, constant: 1).isActive = true
        deathLabel.heightAnchor.constraint(equalTo: deathsView.heightAnchor, multiplier: 0.2).isActive = true
        deathLabel.centerXAnchor.constraint(equalTo: deathsView.centerXAnchor).isActive = true
        
        recoveredView.addSubview(recoveredCount)
        recoveredCount.translatesAutoresizingMaskIntoConstraints = false
        recoveredCount.topAnchor.constraint(equalTo: deathSymbol.bottomAnchor, constant: 15).isActive = true
        recoveredCount.widthAnchor.constraint(equalTo: recoveredView.widthAnchor, multiplier: 0.3).isActive = true
        recoveredCount.heightAnchor.constraint(equalTo: recoveredView.heightAnchor, multiplier: 0.3).isActive = true
        recoveredCount.centerXAnchor.constraint(equalTo: recoveredView.centerXAnchor).isActive = true
        
        recoveredView.addSubview(reacoveredLabel)
        reacoveredLabel.translatesAutoresizingMaskIntoConstraints = false
        reacoveredLabel.topAnchor.constraint(equalTo: recoveredCount.bottomAnchor, constant: 1).isActive = true
        reacoveredLabel.heightAnchor.constraint(equalTo: recoveredView.heightAnchor, multiplier: 0.2).isActive = true
        reacoveredLabel.centerXAnchor.constraint(equalTo: recoveredView.centerXAnchor).isActive = true

        
       
        
         navigationController?.navigationBar.isHidden = false
        
            }
    
    func addMap()  {
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
       
            mapHomeView.addSubview(mapView)
            NSLayoutConstraint.activate([
                mapView.topAnchor.constraint(equalTo: mapHomeView.topAnchor),
                mapView.leadingAnchor.constraint(equalTo: mapHomeView.leadingAnchor),
                mapView.trailingAnchor.constraint(equalTo: mapHomeView.trailingAnchor),
                mapView.bottomAnchor.constraint(equalTo: mapHomeView.bottomAnchor)
            ])
            mapView.frame = mapHomeView.frame
            
            mapView.showsUserLocation = true
            mapView.userTrackingMode = .follow
        


    }
    
    func fetchUsers() {
             
             guard let location = locationManager?.location else { return }
             Service.shared.fetchUsersLocation(location: location) { (user) in
                 guard let coordinate = user.location?.coordinate else { return }
                 let annotation = UserAnnotation(uid: user.uid, coordinate: coordinate)
                 
                 var userIsVisible: Bool {
                     
                     return self.mapView.annotations.contains { (annotation) -> Bool in
                         guard let userAnno = annotation as? UserAnnotation else { return false }
                         
                         if userAnno.uid == user.uid {
                             userAnno.updateAnnotationPosition(withCoordinate: coordinate)
                             return true
                         }
                         
                         return false
                     }
                 }
                 
                 if !userIsVisible {
                     self.mapView.addAnnotation(annotation)
                 }
             }
         }
    
    @objc func handleSetting() {
        checkIsUserLoggedInSettings()
//            let settingViewController = SettingsViewController()
//            navigationController?.pushViewController(settingViewController, animated: true)
   
        }
    
    @objc func handleUpdate() {
        checkIsUserLoggedInUpdate()
//               let updateViewController = UpdateViewController()
//               navigationController?.pushViewController(updateViewController, animated: true)
      
           }
    @objc func showNotifications() {
               let notificationViewController = NotificationViewController()
               navigationController?.pushViewController(notificationViewController, animated: true)
      
           }
    
    @objc func showMap() {
                  let mapViewController = MapViewController()
                  navigationController?.pushViewController(mapViewController, animated: true)
         
              }
    
    @objc func showSafeActions() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let safeactionviewcontroller = SafeActionCollectionViewController(collectionViewLayout: layout)
        
        
                     navigationController?.pushViewController(safeactionviewcontroller, animated: true)
            
                 }
    
    
}

extension HomeViewController {
    
    func  accessLocationServices() {

        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager?.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedWhenInUse:
            locationManager?.requestAlwaysAuthorization()
        case .authorizedAlways:
            locationManager?.startUpdatingLocation()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        default:
            break
        }
    }
}
