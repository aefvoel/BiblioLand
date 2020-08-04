//
//  Book.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 28/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import Foundation
import UIKit

class Borrowers {
    var boorowersName: String
    
    init(borrowersName: String) {
        self.boorowersName = borrowersName
    }
}

class books {
    var bookImage: UIImage?
    var bookTitle: String?
    var pricing: Int?
    var deposit: Int?
    
    init(bookImage: UIImage, bookTitle: String, pricing: Int, deposit: Int) {
        self.bookImage = bookImage
        self.bookTitle = bookTitle
        self.pricing = pricing
        self.deposit = deposit
    }
}

class BookForCheckout {
    var booksData: [books]?
    var borrowers: Borrowers?
    
    init(booksData: [books], borrowers: Borrowers) {
        self.booksData = booksData
        self.borrowers = borrowers
    }
}
