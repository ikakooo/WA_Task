//
//  UDManager.swift
//  WA_Task
//
//  Created by Irakli Chkhitunidzde on 04.03.22.
//

import Foundation

struct UDManager {
    
    // MARK: - Keys
    private static let FIRSTLY_USER_OPEN_APP = "FIRSTLY_USER_OPEN_APP"
    private static let KEY_IS_USER_LOGGED_IN = "KEY_IS_USER_LOGGED_IN"
    private static let KEY_USER_CREDENTIAL_USERNAME = "KEY_USER_CREDENTIAL_USERNAME"
    private static let KEY_USER_CREDENTIAL_PASSWORD = "KEY_USER_CREDENTIAL_PASSWORD"
    
    private static var ud = UserDefaults.standard
    
    static func markUserAsLoggedIn() {
        ud.set(true, forKey: KEY_IS_USER_LOGGED_IN)
        ud.set("",forKey: KEY_USER_CREDENTIAL_USERNAME)
        ud.set("",forKey: KEY_USER_CREDENTIAL_PASSWORD)
    }
    
    static func markUserAsLoggedOut() {
        ud.set(false, forKey: KEY_IS_USER_LOGGED_IN)
        ud.set("",forKey: KEY_USER_CREDENTIAL_USERNAME)
        ud.set("",forKey: KEY_USER_CREDENTIAL_PASSWORD)
    }
    
    static func isUserLoggedIn() -> Bool {
        
        ud.bool(forKey: KEY_IS_USER_LOGGED_IN)
        //return false
    }
    
    static func saveUserAndMarkUserAsLoggedIn(user: User) {
        ud.set(true, forKey: KEY_IS_USER_LOGGED_IN)
        ud.set(user.username,forKey: KEY_USER_CREDENTIAL_USERNAME)
        ud.set(user.password,forKey: KEY_USER_CREDENTIAL_PASSWORD)
    }
}
