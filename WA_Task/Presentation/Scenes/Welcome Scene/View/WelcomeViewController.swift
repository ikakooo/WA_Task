//
//  WelcomeViewController.swift
//  WA_Task
//
//  Created by Irakli Chkhitunidzde on 02.03.22.
//

import UIKit

class WelcomeViewController: UIViewController, LoginDelegate {
    
    func logIn() {
        let sb = UIStoryboard(name: "UsersListViewController", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "UsersListViewController") as? UsersListViewController else {return}
        UDManager.markUserAsLoggedIn()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    weak var vc:WelcomeViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .black
        vc = self
        
        if UDManager.isUserLoggedIn() {
            logIn()
        }
    }
    @IBAction func onLoginButtonClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "LogInViewController", bundle: nil)
      guard  let viewController = storyboard.instantiateViewController(withIdentifier: "LogInViewController") as? LogInViewController else { return }
        viewController.delegate = vc
        if let presentationController = viewController.presentationController as? UISheetPresentationController {
            presentationController.detents = [.large()] /// set here!
        }
        
        self.present(viewController, animated: true)
        
    }
    
    @IBAction func onCreateAccountClick(_ sender: Any){
        
        let storyboard = UIStoryboard(name: "CreateAccountViewController", bundle: nil)
        guard  let viewController = storyboard.instantiateViewController(withIdentifier: "CreateAccountViewController") as? CreateAccountViewController else { return }
        
        viewController.delegate = vc
        
        if let presentationController = viewController.presentationController as? UISheetPresentationController {
            presentationController.detents = [.large()] /// set here!
        }
        
        self.present(viewController, animated: true)
        
    }
}

protocol LoginDelegate {
    func logIn()
}
