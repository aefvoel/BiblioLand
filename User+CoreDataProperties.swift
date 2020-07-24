//
//  User+CoreDataProperties.swift
//  BiblioLand
//
//  Created by Toriq Wahid Syaefullah on 24/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var address: String?
    @NSManaged public var email: String?
    @NSManaged public var first_name: String?
    @NSManaged public var insert_date: Date?
    @NSManaged public var last_name: String?
    @NSManaged public var password: String?
    @NSManaged public var phone: String?
    @NSManaged public var photo: String?
    @NSManaged public var role: String?

}
