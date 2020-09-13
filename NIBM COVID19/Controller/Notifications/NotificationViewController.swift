//
//  NotificationViewController.swift
//  NIBM COVID19
//
//  Created by Thanuja Nayanajith on 9/13/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    // MARK: - Properties
       let tableView = UITableView()

    // MARK: - Lifecycale

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()

       
    }
    
        // MARK: - Functions
    
    func setTableView()  {
        tableView.frame = self.view.frame
        tableView.backgroundColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        self.view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath)"
        return cell
    }
    
}
 
