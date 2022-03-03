//
//  CreateAccountViewController.swift
//  WA_Task
//
//  Created by Irakli Chkhitunidzde on 02.03.22.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var usernameInputFild: FloatingLabelInput!
    @IBOutlet weak var emailInputFild: FloatingLabelInput!
    @IBOutlet weak var passwordInputFild: FloatingLabelInput!
    @IBOutlet weak var confirmPasswordInputFild: FloatingLabelInput!

    var delegate:LoginDelegate?
    
    private var viewModel: CreateAccountViewModelProtocol!
    private var dataService: CreateAccountDataService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
    }
    
    private func configureDataSource() {
        unowned let vc = self
        viewModel = CreateAccountViewModel()
        dataService = CreateAccountDataService(withController: vc,
                                               usernameLabel: usernameInputFild,
                                               emailLabel: emailInputFild,
                                               passwordLabel: passwordInputFild,
                                               confirmPasswordLabel: confirmPasswordInputFild,
                                               logInDelegate: delegate,
                                               
                                               viewModel: viewModel)
    }
    
    @IBAction func ActionOnUsernameTextChange(_ sender: Any) {
        dataService.updateUsernameInputStatus()
    }
    
    @IBAction func ActionOnEmailTextChange(_ sender: Any) {
        dataService.updateEmailInputStatus()
    }
    
    @IBAction func ActionOnPasswordTextChange(_ sender: Any) {
        dataService.updatePasswordInputStatus()
        dataService.updateConfirmPasswordInputStatus()
    }
    
    @IBAction func ActionOnConfirmPasswordTextChange(_ sender: Any) {
        dataService.updateConfirmPasswordInputStatus()
    }
    
    @IBAction func ActionOnRegisterClick(_ sender: Any) {
        dataService.updateUsernameInputStatus()
        dataService.updateEmailInputStatus()
        dataService.updatePasswordInputStatus()
        dataService.updateConfirmPasswordInputStatus()
        dataService.tryCreateAccount()
    }
    
    @IBAction func onCloseButtonClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func onLoginButtonClick(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "LogInViewController", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "LogInViewController") as? LogInViewController else { return }
        
        if let presentationController = viewController.presentationController as? UISheetPresentationController {
            presentationController.detents = [.large()] /// set here!
        }
        
        let presenter = self.presentingViewController
        self.dismiss(animated: true, completion: { presenter?.present(viewController, animated: true) })
    }
}
