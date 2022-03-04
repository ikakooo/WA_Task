//
//  UsersListDataService.swift
//  WA_Task
//
//  Created by Irakli Chkhitunidzde on 03.03.22.
//

import UIKit

class UsersListDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    
    private var controller: UIViewController!
    private var usersTableView: UITableView!
    private var viewModel: UsersListViewModelProtocol!
    
    private var usersList:[User] = [] {
        didSet{
            usersTableView.reloadData()
        }
    }
    
    init(withController: UIViewController,
         usersTableView: UITableView,
         viewModel: UsersListViewModelProtocol)
    {
        super.init()
        self.controller = withController
        self.usersTableView = usersTableView
        self.usersTableView.dataSource = self
        self.usersTableView.delegate = self
        self.usersTableView.registerNib(class: UserCell.self)
        self.viewModel = viewModel
    }
    
    func refresh(){
        viewModel.getUsersList(){ users in
            self.usersList = users
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        usersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(UserCell.self, for: indexPath)
        cell.configure(name:  usersList[indexPath.row].username ?? " ")
        return cell
    }
    
    // Cell click listener
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "AddOrEditUserViewController", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "AddOrEditUserViewController") as? AddOrEditUserViewController else {return}

        vc.edittIngUser = { [ weak self] in  return self?.usersList[indexPath.row]}

        self.controller.navigationController?.pushViewController(vc, animated: true)
    }
}

