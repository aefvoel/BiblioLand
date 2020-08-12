//
//  getCheckoutData.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 29/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import Foundation
import UIKit

func insertData() -> [BookForCheckout] {
    var bookForCheckout = [BookForCheckout]()
    let borrowers1 = Borrowers.init(borrowersName: "Dicky")
    let borrowers3 = Borrowers.init(borrowersName: "Fei")
    
    var books1 = [books]()
    books1.append(books.init(bookImage: #imageLiteral(resourceName: "whiteout"), bookTitle: "White Out", pricing: 1500, deposit: 20000))
    
    var book3 = [books]()
    book3.append(books.init(bookImage: #imageLiteral(resourceName: "queensperil"), bookTitle: "Queens Peril", pricing: 1000, deposit: 15000))
    
    bookForCheckout.append(BookForCheckout.init(booksData: books1, borrowers: borrowers1))
    bookForCheckout.append(BookForCheckout.init(booksData: book3, borrowers: borrowers3))
    
    return bookForCheckout
}

func insertBook() -> [books] {
    var booksData = [books]()
    
    booksData.append(books.init(bookImage: #imageLiteral(resourceName: "Book2"), bookTitle: "The King of Drugs", pricing: 2000, deposit: 20000))
    booksData.append(books.init(bookImage: #imageLiteral(resourceName: "Buku"), bookTitle: "Alice of Adventures", pricing: 3000, deposit: 30000))
    booksData.append(books.init(bookImage: #imageLiteral(resourceName: "Book2"), bookTitle: "The King of Drugs", pricing: 2000, deposit: 20000))
    booksData.append(books.init(bookImage: #imageLiteral(resourceName: "Buku"), bookTitle: "Alice of Adventures", pricing: 3000, deposit: 30000))
    booksData.append(books.init(bookImage: #imageLiteral(resourceName: "Book2"), bookTitle: "The King of Drugs", pricing: 2000, deposit: 20000))
    booksData.append(books.init(bookImage: #imageLiteral(resourceName: "Buku"), bookTitle: "Alice of Adventures", pricing: 3000, deposit: 30000))
    booksData.append(books.init(bookImage: #imageLiteral(resourceName: "Book2"), bookTitle: "The King of Drugs", pricing: 2000, deposit: 20000))
    booksData.append(books.init(bookImage: #imageLiteral(resourceName: "Buku"), bookTitle: "Alice of Adventures", pricing: 3000, deposit: 30000))
    
    return booksData
}
