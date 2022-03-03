//
//  LogInViewDataService.swift
//  WA_Task
//
//  Created by Irakli Chkhitunidzde on 03.03.22.
//

import UIKit

class LogInViewDataService:NSObject {
    
    
    private var controller: UIViewController!
    private var viewModel: LogInViewModelProtocol!
    
    private var emailLabel: FloatingLabelInput!
    private var passwordLabel: FloatingLabelInput!
    
    private var logInDelegate:LoginDelegate?
    
    
    init(withController: UIViewController,
         emailLabel: FloatingLabelInput!,
         passwordLabel: FloatingLabelInput,
         logInDelegate:LoginDelegate?,
         viewModel: LogInViewModelProtocol)
    {
        super.init()
        self.controller = withController
        self.emailLabel = emailLabel
        self.passwordLabel = passwordLabel
        self.logInDelegate = logInDelegate
        self.viewModel = viewModel
    }
    
    func tryLogIn(){
        
        // email
        guard  let email = emailLabel.text,
               !email.isEmpty,
               email.isValidEmail()
        else {
            self.controller.openAlert(title: "Email must be valid!", message: "", closeButtonTitle: "Try again"){}
            return }
        // password
        guard
        let password = passwordLabel.text,
        password.count > 7
        else {
            self.controller.openAlert(title: "Password must be minimum 8 Character!", message: "", closeButtonTitle: "Try again"){}
            return}
    }
    
    func updateEmailInputStatus(){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
        var image: UIImage? = nil
        guard let emailText = emailLabel.text else {return}
        emailLabel.rightViewMode = UITextField.ViewMode.always
        
        if emailText.isValidEmail(){
            image = UIImage(named: "ic_correct");
        } else {
            image = UIImage(named: "ic_error");
        }
        
        
        imageView.image = image
        emailLabel.rightView = imageView
    }
    
    func updatePasswordInputStatus(){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
        var image: UIImage? = nil
        guard let password = passwordLabel.text else {return}
        passwordLabel.rightViewMode = UITextField.ViewMode.always
        
        if password.count > 7 {
            image = UIImage(named: "ic_correct");
        } else {
            image = UIImage(named: "ic_error");
        }
        
        
        imageView.image = image
        passwordLabel.rightView = imageView
        
    }
    
    
}
