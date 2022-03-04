//
//  UsersCoreDataManager.swift
//  WA_Task
//
//  Created by Irakli Chkhitunidzde on 03.03.22.
//

import CoreData
import UIKit

class UsersCoreDataManager {
    static let shared = UsersCoreDataManager()
    private init(){}
    
    
    
    func saveUser(info:User){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Create a new UserEntity in the
        // NSManagedObjectContext context
        let user = Users(context: managedContext)
        
        // Assign values to the entity's properties
        user.username = info.username
        user.email = info.email
        user.password = info.password
        
        
        // To save the new entity to the persistent store, call
        // save on the context
        do {
            try managedContext.save()
        }
        catch {
            // Handle Error
        }
    }
    
    func tryFetch(user:User)->Bool{
        guard let userEmail = user.email else { return false }
        guard let userpassword = user.password else { return false }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return false
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        print("Fetching Data..")
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            for data in result as! [NSManagedObject] {
                  let email = data.value(forKey: "email") as? String
                  let password = data.value(forKey: "password") as? String
                if (email == userEmail  && password == userpassword){return true}
            }
        } catch {
            print("Fetching data Failed")
        }
        return false
    }
    
    func tryFetchAllUsers()->[User]{
        var allUsers:[User] = []
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return allUsers
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        print("Fetching Data..")
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            for data in result as! [NSManagedObject] {
                let username = data.value(forKey: "username") as? String
                let email = data.value(forKey: "email") as? String
                let password = data.value(forKey: "password") as? String
                
                allUsers.append(User(username: username, email: email, password: password))
            }
        } catch {
            print("Fetching data Failed")
        }
        return allUsers
    }
    
    func delete(user:User) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        print("Fetching Data..")
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            for data in result as! [NSManagedObject] {
                let username = data.value(forKey: "username") as? String
                let email = data.value(forKey: "email") as? String
                let password = data.value(forKey: "password") as? String
                
                if username == user.password && email == user.email && password == user.password {
                    managedContext.delete(data)
                    try managedContext.save()
                }
            }
        } catch {
            print("Fetching data Failed")
        }
    }
    
}
