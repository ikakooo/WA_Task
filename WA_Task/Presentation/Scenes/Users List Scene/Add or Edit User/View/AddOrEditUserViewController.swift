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
        configureDataSourceForUserAdding()
        configureDataSourceForEditing()
    }
    
    private func  configureDataSourceForUserAdding() {
        title = "Add User"
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
        guard let username = usernameInput.text,
              let email = emailInput.text,
              let password = passworInput.text,
              let confirmPassword = confirmPassworInput.text
        else { return }
        
        if password != confirmPassword {
            
        
        }
        
        // password
        guard
        let password = passworInput.text,
        let confirmPassword = confirmPassworInput.text,
        password == confirmPassword,
        password.count > 7
        else {
            self.openAlert(title: "Password and ConfirmPassword must be same and minimum 8 Character!", message: "", closeButtonTitle: "Try again"){}
            return }
        
        if edittIngUser?() == nil {
            UsersCoreDataManager.shared.saveUser(info: User(username: username,email: email, password: password))
            self.openAlert(title: "User Added", message: "", closeButtonTitle: "OK"){ [unowned self] in
                self.navigationController?.popViewController(animated: true)
            }
        }else {
            UsersCoreDataManager.shared.delete(user: (edittIngUser?())!)
            UsersCoreDataManager.shared.saveUser(info: User(username: username,email: email, password: password))
            
            self.openAlert(title: "User updated", message: "", closeButtonTitle: "OK"){ [unowned self] in
                self.navigationController?.popViewController(animated: true)
            }
        }
        
        
    }
}
