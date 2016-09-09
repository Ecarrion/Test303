//
//  MainViewController.swift
//  Test303
//
//  Created by Ernesto Carrion on 9/8/16.
//  Copyright © 2016 ecarrion. All rights reserved.
//

import UIKit
import RxSwift

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let dataSource = UsersDataSource(cellIdentifier: "UsersCellIdentifier")
    let disposeBag = DisposeBag()
    let userNetworkService = UserService()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        requestUserData()
        styleTableViewEdges()
    }

    func styleTableViewEdges() {
        tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
    }
    
    func requestUserData() {

        userNetworkService.getUsers().subscribeNext { [weak self] users in

            self?.dataSource.users = users.map(UserViewModel.init)
            self?.tableView.reloadData()

        }.addDisposableTo(disposeBag)
    }
}
