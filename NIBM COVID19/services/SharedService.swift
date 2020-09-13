//
//  SharedService.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/14/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import Firebase
import GeoFire


let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
let REF_USER_LOCATIONS = DB_REF.child("locations")

struct Service {
    
    static let shared = Service()
    
//    func fetchUserData(uid: String, completion: @escaping(User) -> Void) {
//        REF_USERS.child(uid).observeSingleEvent(of: .value) { (snapshot) in
//            guard let dictionary = snapshot.value as? [String: Any] else { return }
//            let uid = snapshot.key
//            let user = User(uid: uid, dictionary: dictionary)
//            completion(user)
//        }
//    }
}


