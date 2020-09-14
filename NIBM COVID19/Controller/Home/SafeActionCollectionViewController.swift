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

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Safe Actions"
        collectionView?.backgroundColor = .white

        collectionView?.register(SafeActionCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView?.isPagingEnabled = true
        
        navigationController?.navigationBar.isHidden = false

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
    

}
