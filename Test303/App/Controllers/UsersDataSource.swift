//
//  UsersDataSource.swift
//  Test303
//
//  Created by Ernesto Carrion on 9/9/16.
//  Copyright © 2016 ecarrion. All rights reserved.
//

import Foundation
import UIKit

class UsersDataSource: NSObject, UITableViewDataSource {

    let cellIdentifier: String
    var users: [UserViewModel]
    init(users: [User] = [], cellIdentifier: String) {
        self.users = users.map(UserViewModel.init)
        self.cellIdentifier = cellIdentifier
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let userViewModel = users[indexPath.row]
        let cell = dequeCell(tableView)
        cell.textLabel?.text = userViewModel.fullName
        cell.detailTextLabel?.text = userViewModel.city
        return cell
    }
    
    func dequeCell(tableView: UITableView) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) else {
            return UITableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
        }
        
        return cell
    }
}
