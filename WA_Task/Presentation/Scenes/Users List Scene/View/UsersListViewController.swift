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
    
    override func viewWillAppear(_ animated: Bool) {
        dataService.refresh()
    }
    
    @IBAction func onLogOutClick(_ sender: Any) {
        UDManager.markUserAsLoggedOut()
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onAddUserButtonClick(_ sender: Any) {
        let sb = UIStoryboard(name: "AddOrEditUserViewController", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "AddOrEditUserViewController") as? AddOrEditUserViewController else {return}
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
