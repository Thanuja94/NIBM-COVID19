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
        button.addTarget(self, action: #selector(handleClose), for: .touchUpInside)
        
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
//        button.addTarget(self, action: #selector(handlesignin), for: .touchUpInside)
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
        button.addTarget(self, action: #selector(showSurvay), for: .touchUpInside)
        return button
    }()
    
    private let survayUpdatetimeLable: UILabel = {
        let label = UILabel()
        label.text = "Last Update :"
        label.font = UIFont(name: "Avenir-Light" , size: 15)
        label.textColor = .gray
        
        return label
    }()
    
    private let survayUpdatetime: UILabel = {
        let label = UILabel()
        label.text = "2020-01-01"
        label.font = UIFont(name: "Avenir-Light" , size: 15)
        label.textColor = .gray
        
        return label
    }()
    
    private let temperatureValue: UILabel = {
        let label = UILabel()
        label.text = "36.3"
        label.font = UIFont(name: "Avenir-Light" , size: 60)
        
        label.textColor = .black
        label.numberOfLines = 0
        
        return label
    }()
    
    private let tempUnit: UILabel = {
        let label = UILabel()
        label.text = "C"
        label.font = UIFont(name: "Avenir-Light" , size: 25)
        label.textColor = .gray
        
        return label
    }()
    
    private let tempDegree: UILabel = {
        let label = UILabel()
        label.text = "o"
        label.font = UIFont(name: "Avenir-Light" , size: 15)
        label.textColor = .gray
        
        return label
    }()
    
    private let tempUpdatetimeLable: UILabel = {
        let label = UILabel()
        label.text = "Last Update :"
        label.font = UIFont(name: "Avenir-Light" , size: 15)
        label.textColor = .gray
        
        return label
    }()
    
    private let tempUpdatetime: UILabel = {
        let label = UILabel()
        label.text = "1 day ago"
        label.font = UIFont(name: "Avenir-Light" , size: 15)
        label.textColor = .gray
        
        return label
    }()
    
    private let temperatureTextFiled: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .line
        textfield.textColor = .black
        
        
        return textfield
        
    }()
    
    private let updateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Update", for: .normal)
        // button.font = UIFont(name: "Avenir-Light", size: 35) ?? <#default value#>
        button.setTitleColor(UIColor(white: 1, alpha: 1), for: .normal)
        button.backgroundColor = colors.cynaite
        button.layer.cornerRadius = 10
        //           button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        //button.addTarget(self, action: #selector(handlesignin), for: .touchUpInside)
        
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
        
        
        survayLabelView.addSubview(survayUpdatetimeLable)
        survayUpdatetimeLable.translatesAutoresizingMaskIntoConstraints = false
        survayUpdatetimeLable.heightAnchor.constraint(equalTo: survayLabelView.heightAnchor, multiplier: 0.3).isActive = true
        survayUpdatetimeLable.leadingAnchor.constraint(equalTo: survayLabelView.leadingAnchor, constant: 5).isActive = true
        survayUpdatetimeLable.topAnchor.constraint(equalTo: createSurvayLable.topAnchor, constant: 20).isActive = true
        
        survayLabelView.addSubview(survayUpdatetime)
        survayUpdatetime.translatesAutoresizingMaskIntoConstraints = false
        survayUpdatetime.heightAnchor.constraint(equalTo: survayLabelView.heightAnchor, multiplier: 0.3).isActive = true
        survayUpdatetime.leadingAnchor.constraint(equalTo: survayUpdatetimeLable.trailingAnchor, constant: 5).isActive = true
        survayUpdatetime.topAnchor.constraint(equalTo: createSurvayLable.topAnchor, constant: 20).isActive = true
        
        
        tempUpdateView.addSubview(temperatureValue)
        temperatureValue.translatesAutoresizingMaskIntoConstraints = false
        temperatureValue.heightAnchor.constraint(equalTo: tempUpdateView.heightAnchor, multiplier: 0.3).isActive = true
        temperatureValue.topAnchor.constraint(equalTo: tempUpdateView.topAnchor, constant: 10).isActive = true
        temperatureValue.centerXAnchor.constraint(equalTo: tempUpdateView.centerXAnchor).isActive = true
        
        tempUpdateView.addSubview(tempUnit)
        tempUnit.translatesAutoresizingMaskIntoConstraints = false
        tempUnit.heightAnchor.constraint(equalTo: tempUpdateView.heightAnchor, multiplier: 0.1).isActive = true
        tempUnit.leadingAnchor.constraint(equalTo: temperatureValue.trailingAnchor, constant: 10).isActive = true
        tempUnit.topAnchor.constraint(equalTo: tempUpdateView.topAnchor, constant: 25).isActive = true
        
        tempUpdateView.addSubview(tempDegree)
        tempDegree.translatesAutoresizingMaskIntoConstraints = false
        tempDegree.heightAnchor.constraint(equalTo: tempUpdateView.heightAnchor, multiplier: 0.1).isActive = true
        tempDegree.leadingAnchor.constraint(equalTo: temperatureValue.trailingAnchor, constant: 4).isActive = true
        tempDegree.topAnchor.constraint(equalTo: tempUpdateView.topAnchor, constant: 15).isActive = true
        
        tempUpdateView.addSubview(tempUpdatetimeLable)
        tempUpdatetimeLable.translatesAutoresizingMaskIntoConstraints = false
        tempUpdatetimeLable.heightAnchor.constraint(equalTo: tempUpdateView.heightAnchor, multiplier: 0.1).isActive = true
        tempUpdatetimeLable.topAnchor.constraint(equalTo: temperatureValue.bottomAnchor, constant: 10).isActive = true
        tempUpdatetimeLable.leadingAnchor.constraint(equalTo: tempUpdateView.leadingAnchor, constant: 85).isActive = true
        
        tempUpdateView.addSubview(tempUpdatetime)
        tempUpdatetime.translatesAutoresizingMaskIntoConstraints = false
        tempUpdatetime.heightAnchor.constraint(equalTo: tempUpdateView.heightAnchor, multiplier: 0.1).isActive = true
        tempUpdatetime.topAnchor.constraint(equalTo: temperatureValue.bottomAnchor, constant: 10).isActive = true
        tempUpdatetime.leadingAnchor.constraint(equalTo: tempUpdatetimeLable.trailingAnchor, constant: 15).isActive = true
        
        tempUpdateView.addSubview(temperatureTextFiled)
        temperatureTextFiled.translatesAutoresizingMaskIntoConstraints = false
        temperatureTextFiled.heightAnchor.constraint(equalTo: tempUpdateView.heightAnchor, multiplier: 0.2).isActive = true
        temperatureTextFiled.topAnchor.constraint(equalTo: tempUpdatetime.bottomAnchor, constant: 10).isActive = true
        temperatureTextFiled.centerXAnchor.constraint(equalTo: tempUpdateView.centerXAnchor).isActive = true
        temperatureTextFiled.widthAnchor.constraint(equalTo: tempUpdateView.widthAnchor, multiplier: 0.4).isActive = true
        
        tempUpdateView.addSubview(updateButton)
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.heightAnchor.constraint(equalTo: tempUpdateView.heightAnchor, multiplier: 0.2).isActive = true
        updateButton.topAnchor.constraint(equalTo: temperatureTextFiled.bottomAnchor, constant: 10).isActive = true
        updateButton.centerXAnchor.constraint(equalTo: tempUpdateView.centerXAnchor).isActive = true
        updateButton.widthAnchor.constraint(equalTo: tempUpdateView.widthAnchor, multiplier: 0.4).isActive = true
        
        
        navigationController?.navigationBar.isHidden = true
        
        
    }
    
    @objc func handleClose() {
        
         navigationController?.popViewController(animated: true)
    }

    @objc func showSurvay()  {
        let survayQ1ViewContrller = SurvayQ1ViewController()
        navigationController?.pushViewController(survayQ1ViewContrller, animated: true)
    }
}
