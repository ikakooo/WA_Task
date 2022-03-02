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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
