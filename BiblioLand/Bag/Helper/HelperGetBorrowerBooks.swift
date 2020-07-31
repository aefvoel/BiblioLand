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
    let borrowers1 = Borrowers.init(borrowersName: "DQ")
    let borrowers2 = Borrowers.init(borrowersName: "DQ Ja")
    let borrowers3 = Borrowers.init(borrowersName: "Ncups")
    
    var books1 = [books]()
    books1.append(books.init(bookImage: #imageLiteral(resourceName: "Book2"), bookTitle: "The King of Drugs", pricing: 2000, deposit: 20000))
    books1.append(books.init(bookImage: #imageLiteral(resourceName: "Buku"), bookTitle: "Alice of Adventures", pricing: 3000, deposit: 30000))
    
    var book2 = [books]()
    book2.append(books.init(bookImage: #imageLiteral(resourceName: "Success Pay"), bookTitle: "Istri Salehah", pricing: 5000, deposit: 40000))
    
    var book3 = [books]()
    book3.append(books.init(bookImage: #imageLiteral(resourceName: "onboarding_1"), bookTitle: "Suami Solehah", pricing: 10000, deposit: 50000))
    
    bookForCheckout.append(BookForCheckout.init(booksData: books1, borrowers: borrowers1))
    bookForCheckout.append(BookForCheckout.init(booksData: book2, borrowers: borrowers2))
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
