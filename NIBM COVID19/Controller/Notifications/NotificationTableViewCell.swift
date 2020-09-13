//
//  NotificationTableViewCell.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/13/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    

    lazy var backView: UIView = {
        
        let view = UIView(frame: CGRect(x: 10, y: 6, width: UIScreen.main.bounds.size.width-20 , height: 110))
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var notificationImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 4, y: 6, width: 108, height: 108))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var notificatonLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 116, y: 10, width: backView.frame.width - 126, height: 30))
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir-Light" , size: 15)
        label.numberOfLines = 0
        return label
        
    }()
    
    override func layoutSubviews() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(backView)
        backView.addSubview(notificationImage)
        backView.addSubview(notificatonLabel)
 
        // Configure the view for the selected state
    }

}
