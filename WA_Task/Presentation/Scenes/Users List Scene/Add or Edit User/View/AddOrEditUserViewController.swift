//
//  AddOrEditUserViewController.swift
//  WA_Task
//
//  Created by Irakli Chkhitunidzde on 04.03.22.
//

import UIKit

class AddOrEditUserViewController: UIViewController {
    @IBOutlet weak var usernameInput: FloatingLabelInput!
    
    @IBOutlet weak var passworInput: FloatingLabelInput!
    @IBOutlet weak var confirmPassworInput: FloatingLabelInput!
    @IBOutlet weak var emailInput: FloatingLabelInput!
    
    var edittIngUser: (() -> User?)?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSourceForEditing()
    }
    

    private func configureDataSourceForEditing() {
        guard let user = edittIngUser?() else { dismiss(animated: true, completion: nil); return}
        title = "Edit User"
        // unowned let this =  self
        usernameInput.addFloatingLabel()
        usernameInput.text = user.username
        emailInput.addFloatingLabel()
        emailInput.text = user.email
        passworInput.addFloatingLabel()
        passworInput.text = user.password
        confirmPassworInput.addFloatingLabel()
        confirmPassworInput.text = user.password
        
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
    
    @IBAction func onSaveButtonClick(_ sender: Any) {
        
        
    }
}
