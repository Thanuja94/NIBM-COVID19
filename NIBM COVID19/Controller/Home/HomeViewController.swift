//
//  HomeViewController.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/8/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
 
    // MARK: - Properties
    
    // MARK: - Lifecycale
    
    override func viewDidLoad() {
        super.viewDidLoad()
checkIsUserLoggedIn()
        view.backgroundColor = .yellow
    }
    
    // MARK: - Functions
    
    func checkIsUserLoggedIn() {
        if(Auth.auth().currentUser?.uid == nil) {
            DispatchQueue.main.async {
                           let navigation = UINavigationController(rootViewController: LoginViewController())
                            navigation.modalPresentationStyle = .fullScreen
                           self.present(navigation, animated: true, completion: nil)
                       }
        } else {
            print("DEBUG: User is logged in..")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: sign out error")
        }
    }

    
}
