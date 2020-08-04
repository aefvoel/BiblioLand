//
//  CoreDataHelper.swift
//  BiblioLand
//
//  Created by Toriq Wahid Syaefullah on 22/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct CoreDataHelper {
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }

        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext

        return context
    }()
    
    static func insertBook() -> Book {
            let book = NSEntityDescription.insertNewObject(forEntityName: "Book", into: context) as! Book

            return book
    }
    
    static func retrieveBook() -> [Book] {
    do {
        let fetchRequest = NSFetchRequest<Book>(entityName: "Book")
        let results = try context.fetch(fetchRequest)

        return results
    } catch let error {
        print("Could not fetch \(error.localizedDescription)")

        return []
    }
    }
    
    static func newUser() -> User {
            let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as! User

            return user
    }
    
    static func saveUser() {
        do {
            try context.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    static func deleteUser(user: User) {
        context.delete(user)

        saveUser()
    }
    
    static func retrieveUser() -> [User] {
    do {
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        let results = try context.fetch(fetchRequest)

        return results
    } catch let error {
        print("Could not fetch \(error.localizedDescription)")

        return []
    }

}
}
