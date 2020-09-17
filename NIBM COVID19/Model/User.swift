//
//  User.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/14/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import CoreLocation

enum AccountType: Int {
    case student
    case lecturer
}

struct User {
    let firstName: String
    let lastName: String
    let email: String
    var accountType: AccountType!
    var location: CLLocation?
    let uid: String
    let temperature: String
    let country: String
    let Q1: Int
    let Q2: Int
    let Q3: Int
    let Q4: Int
    
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.firstName = dictionary["firstname"] as? String ?? ""
        self.lastName = dictionary["lastname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        
        if let index = dictionary["accountType"] as? Int {
            self.accountType = AccountType(rawValue: index)
        }
        self.temperature = dictionary["bodyTemperature"] as? String ?? "0.0"
        self.country = dictionary["country"] as? String ?? ""
        self.Q1 = dictionary["Q1"] as? Int ?? 0
        self.Q2 = dictionary["Q2"] as? Int ?? 0
        self.Q3 = dictionary["Q3"] as? Int ?? 0
        self.Q4 = dictionary["Q4"] as? Int ?? 0
    }
}
