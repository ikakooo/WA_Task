//
//  DialogAlertsForActions.swift
//  WA_Task
//
//  Created by Irakli Chkhitunidzde on 03.03.22.
//

import UIKit


extension UIViewController {
    func openAlert(title: String,
                   message: String,
                   closeButtonTitle:String,
                   actionAfter: @escaping () -> ())
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: closeButtonTitle, style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                actionAfter()
            case .cancel:
                print("cancel")
                actionAfter()
            case .destructive:
                print("destructive")
                actionAfter()
                
            @unknown default:
                fatalError()
            }
            
        }))
        self.present(alert, animated: true)
    }
    
}
