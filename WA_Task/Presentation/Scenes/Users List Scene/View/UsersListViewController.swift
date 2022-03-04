//
//  UsersListViewController.swift
//  WA_Task
//
//  Created by Irakli Chkhitunidzde on 02.03.22.
//

import UIKit

class UsersListViewController: UIViewController {
    @IBOutlet weak var usersTableView: UITableView!
    
    private var viewModel: UsersListViewModelProtocol!
    private var dataService: UsersListDataService!

    override func viewDidLoad() {
        super.viewDidLoad()
      // UsersListDataService
        configureDataSource()
    }
    
    private func configureDataSource() {
        unowned let vc = self
        viewModel = UsersListViewModel()
        dataService = UsersListDataService(withController: vc,
                                           usersTableView: usersTableView,
                                           viewModel: viewModel)

        dataService.refresh()
        
    }
    @IBAction func onLogOutClick(_ sender: Any) {
        UDManager.markUserAsLoggedOut()
        navigationController?.popViewController(animated: true)
    }
    
}
