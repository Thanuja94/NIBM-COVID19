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
        view.backgroundColor = UIColor.green
        return view
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(backView)

        // Configure the view for the selected state
    }

}
