//
//  Extensions.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 8/31/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                height: CGFloat? = nil,
                width: CGFloat? = nil
    ) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
    
    func centerX(inView view: UIView) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerY(inView view: UIView) {
           centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
       }
    
    func inputContainerView(image: UIImage, textField: UITextField) -> UIView {
        let view = UIView()
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.alpha = 0.87
        view.addSubview(imageView)
        imageView.centerY(inView: view)
        imageView.anchor(left: view.leftAnchor, paddingLeft: 8,  height: 30, width: 30)
        
        view.addSubview(textField)
        textField.centerY(inView: view)
        textField.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
        
        let separatorView = UIView()
        separatorView.backgroundColor = .lightGray
        view.addSubview(separatorView)
        separatorView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, height: 1)
        
        return view
    }
} 

extension UITextField {
    func textField(withPlaceholder placeholder: String, isSecureTextEntry: Bool) -> UITextField{
        let textfield = UITextField()
        textfield.borderStyle = .none
        textfield.font = UIFont.systemFont(ofSize: 30)
        textfield.textColor = .white
        textfield.keyboardAppearance = .dark
        textfield.isSecureTextEntry = isSecureTextEntry
        textfield.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        return textfield
    }
}

extension UIButton {

func alignImageAndTitleVertically(padding: CGFloat ) {
    self.sizeToFit()
    let imageSize = self.imageView!.frame.size
    let titleSize = self.titleLabel!.frame.size
    let totalHeight = imageSize.height + titleSize.height + padding

    self.imageEdgeInsets = UIEdgeInsets(
        top: -(totalHeight - imageSize.height),
        left: 70,
        bottom: 0,
        right: -titleSize.width - 10
    )

    self.titleEdgeInsets = UIEdgeInsets(
        top: 0,
        left: 0,
        bottom: -(totalHeight - titleSize.height),
        right: titleSize.height
    )
    }
}
