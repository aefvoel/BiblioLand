//
//  Book+CoreDataProperties.swift
//  BiblioLand
//
//  Created by Toriq Wahid Syaefullah on 24/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var author: String?
    @NSManaged public var borrower_count: Int16
    @NSManaged public var borrower_name: String?
    @NSManaged public var category: String?
    @NSManaged public var condition: String?
    @NSManaged public var is_borrowed: Bool
    @NSManaged public var language: String?
    @NSManaged public var lender_name: String?
    @NSManaged public var lender_notes: String?
    @NSManaged public var name: String?
    @NSManaged public var pages: Int16
    @NSManaged public var photo: String?
    @NSManaged public var price_deposit: Int64
    @NSManaged public var price_per_day: Int64

}
