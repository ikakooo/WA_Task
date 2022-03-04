//
//  AddOrEditUserViewController.swift
//  WA_Task
//
//  Created by Irakli Chkhitunidzde on 04.03.22.
//

import UIKit

class AddOrEditUserViewController: UIViewController {
    
    
    var edittIngUser: (() -> User?)?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
    }
    

    private func configureDataSource() {
        guard let user = edittIngUser?() else { dismiss(animated: true, completion: nil); return}
        unowned let this =  self
        
        print(user)
//        onlinePlayerName.text = enemy.name
//        viewModel = OnlineGameBoardViewModel()
//        dataService = OnlineGameBoardDataService(withController: this,
//                                                 with: CollectionViewGamePlay,
//                                                 onlinePlayerToe: onlinePlayerToe,
//                                                 appUserToe: appUserToe,
//                                                 playerEnemy: enemy,
//                                                 viewModel: viewModel)
//        dataService.refreshAndEtechOnlinePlayer()
    }
    
}
