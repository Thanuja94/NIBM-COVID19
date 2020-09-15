//
//  SafeActionCollectionViewController.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/14/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SafeActionCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let imageNames = ["safeAction","safeAction2"]
    let instructions = ["Clean your Self" , "Follow above instructions to wear and remove mask correctly"]
    
    let nextButton: UIButton = {
           let button = UIButton(type: .system)
           let attributedTitle = NSMutableAttributedString(string: "Next", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24), NSAttributedString.Key.foregroundColor: colors.aquavelvet])
           
           button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
           
           
           button.setAttributedTitle(attributedTitle, for: .normal)
           return button
       }()
    
    
    private lazy var pageControl: UIPageControl = {
           let pc = UIPageControl()
           pc.numberOfPages = imageNames.count
           pc.currentPage = 0
           pc.currentPageIndicatorTintColor = colors.aquavelvet
           pc.pageIndicatorTintColor = .gray
           
           
           return pc
       }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Safe Actions"
        collectionView?.backgroundColor = .white

        collectionView?.register(SafeActionCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView?.isPagingEnabled = true
        
        navigationController?.navigationBar.isHidden = false
        
        setupUI()

    }

   override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

            let x = targetContentOffset.pointee.x

            pageControl.currentPage = Int(x / view.frame.width)
        }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return imageNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SafeActionCollectionViewCell
        
        let imageName = imageNames[indexPath.item]
        cell.safeActionPic.image = UIImage(named: imageName)
        cell.instruction.text =   instructions[indexPath.item]
    

        return cell
    }
    


 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: view.frame.height)
     }
    
   
    

    func setupUI()  {
        view.addSubview(nextButton)
               nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 15).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
               pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 5).isActive = true
               pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
               pageControl.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
               
    }
    
    @objc private  func handleNext(){
        let Index = min(pageControl.currentPage + 1, imageNames.count - 1)
        
        let indexPath = IndexPath(item: Index, section: 0)
        pageControl.currentPage = Index
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}
