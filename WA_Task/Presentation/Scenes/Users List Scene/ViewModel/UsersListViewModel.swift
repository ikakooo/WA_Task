//
//  UsersListViewModelProtocol.swift
//  WA_Task
//
//  Created by Irakli Chkhitunidzde on 03.03.22.
//

import Foundation
import CloudKit

protocol UsersListViewModelProtocol: AnyObject {
    func getUsersList(users: @escaping (_ users: [User]) -> ())
}

class UsersListViewModel: UsersListViewModelProtocol {
    func getUsersList(users: @escaping (_ users: [User]) -> ()){
        users(UsersCoreDataManager.shared.tryFetchAllUsers())
    }
    
}
