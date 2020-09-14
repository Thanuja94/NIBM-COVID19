//
//  SafeActionCollectionViewCell.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/14/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class SafeActionCollectionViewCell: UICollectionViewCell {
    
    let imageView = UIView()
    let instructionView = UIView()
    
    let safeActionPic = UIImageView(image: #imageLiteral(resourceName: "safeAction1"))
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Next", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: colors.aquavelvet])
        
        //button.addTarget(self, action: #selector(handleYes), for: .touchUpInside)
        
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI()  {
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 65).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        
        instructionView.backgroundColor = .red
        addSubview(instructionView)
        instructionView.translatesAutoresizingMaskIntoConstraints = false
        instructionView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40).isActive = true
        instructionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
        instructionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        
        instructionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
        addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        
        imageView.addSubview(safeActionPic)
        safeActionPic.translatesAutoresizingMaskIntoConstraints = false
        safeActionPic.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 30).isActive = true
        safeActionPic.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 20).isActive = true
        
        safeActionPic.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 0.8).isActive = true
        
        safeActionPic.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -20).isActive = true
        
        
        
    }
    
    
}



