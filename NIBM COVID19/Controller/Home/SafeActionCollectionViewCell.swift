//
//  SafeActionCollectionViewCell.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/14/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class SafeActionCollectionViewCell: UICollectionViewCell {
    
    let Imageview = UIView()
    let homepic = UIImageView(image: #imageLiteral(resourceName: "safeAction1"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI()  {
        addSubview(Imageview)
        
    }
}
