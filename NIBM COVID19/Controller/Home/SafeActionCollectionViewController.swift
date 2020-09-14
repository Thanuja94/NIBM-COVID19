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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .green

        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }

   

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    cell.backgroundColor = .red

        return cell
    }
    


 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: view.frame.height)
     }
    

}
