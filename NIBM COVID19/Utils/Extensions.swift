//
//  Extensions.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 8/31/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import MapKit

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
    
//    func centerY(inView view: UIView, constant: CGFloat = 0) {
//           centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//       }
    
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat = 0, constant: CGFloat = 0) {
           centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
           translatesAutoresizingMaskIntoConstraints = false
           if let left = leftAnchor {
               anchor(left: left, paddingLeft: paddingLeft)
           }
       }
    
    func setDimensions(height: CGFloat, width: CGFloat) {
          translatesAutoresizingMaskIntoConstraints = false
          heightAnchor.constraint(equalToConstant: height).isActive = true
          widthAnchor.constraint(equalToConstant: width).isActive = true
      }
    
    func inputContainerView(image: UIImage, textField: UITextField? = nil, segentedControl: UISegmentedControl? = nil) -> UIView {
        let view = UIView()
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.alpha = 0.87
        view.addSubview(imageView)
                
        if let textField = textField {
            
            imageView.centerY(inView: view)
            imageView.anchor(left: view.leftAnchor, paddingLeft: 8,  height: 30, width: 30)

            
            view.addSubview(textField)
                   textField.centerY(inView: view)
                   textField.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
        }
        
        if let segentedControl = segentedControl {
            
            
                  imageView.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: -8, paddingLeft: 8, height: 24, width: 24)
                  
                  view.addSubview(segentedControl)
                  segentedControl.anchor(left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 8, paddingRight: 8)
                  segentedControl.centerY(inView: view, constant: 10)
              }
        
       
        
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

extension MKMapView {
func zoomToFit(annotations: [MKAnnotation]) {
    var zoomRect = MKMapRect.null
    
    annotations.forEach { (annotation) in
        let annotationPoint = MKMapPoint(annotation.coordinate)
        let pointRect = MKMapRect(x: annotationPoint.x, y: annotationPoint.y,
                                  width: 0.01, height: 0.01)
        zoomRect = zoomRect.union(pointRect)
    }
    
    let insets = UIEdgeInsets(top: 100, left: 100, bottom: 300, right: 100)
    setVisibleMapRect(zoomRect, edgePadding: insets, animated: true)
}
}

