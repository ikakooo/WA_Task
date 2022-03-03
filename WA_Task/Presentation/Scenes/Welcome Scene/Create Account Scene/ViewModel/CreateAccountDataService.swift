//
//  CreateAccountDataService.swift
//  WA_Task
//
//  Created by Irakli Chkhitunidzde on 03.03.22.
//

import UIKit

class CreateAccountDataService: NSObject {
    
    
    private unowned var controller: UIViewController!
    private var viewModel: CreateAccountViewModelProtocol!
    
    private var usernameLabel: FloatingLabelInput!
    private var emailLabel: FloatingLabelInput!
    private var passwordLabel: FloatingLabelInput!
    private var confirmPasswordLabel: FloatingLabelInput!
    
    private var logInDelegate:LoginDelegate?
    
    
    init(withController: UIViewController,
         usernameLabel: FloatingLabelInput,
         emailLabel: FloatingLabelInput!,
         passwordLabel: FloatingLabelInput,
         confirmPasswordLabel: FloatingLabelInput,
         logInDelegate:LoginDelegate?,
         viewModel: CreateAccountViewModelProtocol)
    {
        super.init()
        self.controller = withController
        self.usernameLabel = usernameLabel
        self.emailLabel = emailLabel
        self.passwordLabel = passwordLabel
        self.confirmPasswordLabel = confirmPasswordLabel
        self.logInDelegate = logInDelegate
        self.viewModel = viewModel
    }
    
    
    
    func tryCreateAccount(){
        
        // username
        guard  let username = usernameLabel.text,
        username.count > 3
        else { self.controller.openAlert(title: "Username must be more than 3 simbol!", message: "", closeButtonTitle: "Try again"){}
            return}
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
        let confirmPassword = confirmPasswordLabel.text,
        password == confirmPassword,
        password.count > 7
        else {
            self.controller.openAlert(title: "Password and ConfirmPassword must be same and minimum 8 Character!", message: "", closeButtonTitle: "Try again"){}
            return }
        
        UsersCoreDataManager.shared.saveUser(info: User(username: username,email: email, password: password))
        
        self.controller.openAlert(title: "Successfully registered", message: "", closeButtonTitle: "OK"){
            self.controller.dismiss(animated: true, completion: {
                self.logInDelegate?.logIn()
            })
        }
      
    }
    
    func updateUsernameInputStatus(){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
        var image: UIImage? = nil
        guard let username = usernameLabel.text else {return}
        usernameLabel.rightViewMode = UITextField.ViewMode.always
        
        if username.count > 3 {
            image = UIImage(named: "ic_correct");
        } else {
            image = UIImage(named: "ic_error");
        }
        
        
        imageView.image = image
        usernameLabel.rightView = imageView
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
    
    
    func updateConfirmPasswordInputStatus(){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
        var image: UIImage? = nil
        guard let confirmPassword = confirmPasswordLabel.text else {return}
        guard let password = passwordLabel.text else {return}
        confirmPasswordLabel.rightViewMode = UITextField.ViewMode.always
        
        if confirmPassword == password && !confirmPassword.isEmpty {
            image = UIImage(named: "ic_correct");
        } else {
            image = UIImage(named: "ic_error");
        }
        
        
        imageView.image = image
        confirmPasswordLabel.rightView = imageView
        
    }
    
}
