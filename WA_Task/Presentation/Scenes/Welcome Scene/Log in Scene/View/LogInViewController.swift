//
//  LogInViewController.swift
//  WA_Task
//
//  Created by Irakli Chkhitunidzde on 02.03.22.
//

import UIKit

class LogInViewController: UIViewController {
    @IBOutlet weak var emailInputFild: FloatingLabelInput!
    @IBOutlet weak var passwordInputFild: FloatingLabelInput!
    
    
    var delegate:LoginDelegate?
    
    private var viewModel: LogInViewModelProtocol!
    private var dataService: LogInViewDataService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
    }
    
    private func configureDataSource() {
        unowned let vc = self
        viewModel = LogInViewModel()
        dataService = LogInViewDataService( withController: vc,
                                            emailLabel: emailInputFild,
                                            passwordLabel: passwordInputFild,
                                            logInDelegate: delegate,
                                            viewModel: viewModel)
    }
    
    @IBAction func ActionOnEmailTextChange(_ sender: Any) {
        dataService.updateEmailInputStatus()
    }
    
    @IBAction func ActionOnPasswordTextChange(_ sender: Any) {
        dataService.updatePasswordInputStatus()
    }
    
    @IBAction func onLoginButtonClick(_ sender: Any) {
    
        
    }
    
    @IBAction func onCloseButtonClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onRegisterButtonClick(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "CreateAccountViewController", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CreateAccountViewController") as! CreateAccountViewController
        
        if let presentationController = viewController.presentationController as? UISheetPresentationController {
            presentationController.detents = [.large()] /// set here!
        }
        
        let presenter = self.presentingViewController
        self.dismiss(animated: true, completion: {
            presenter?.present(viewController, animated: true)
        })
        
        
    }
    

}
