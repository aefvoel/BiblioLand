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
    let borrowers1 = Borrowers.init(borrowersName: "DQ Tutupet")
    let borrowers2 = Borrowers.init(borrowersName: "DQ Tuturu")
    
    var books1 = [books]()
    books1.append(books.init(bookImage: #imageLiteral(resourceName: "Book2"), bookTitle: "The King of Drugs", pricing: "Price: Rp2.000", deposit: "Book Deposit: Rp20.000"))
    books1.append(books.init(bookImage: #imageLiteral(resourceName: "Buku"), bookTitle: "Alice of Adventures", pricing: "Price: Rp3.000", deposit: "Book Deposit: Rp20.000"))
    
    var book2 = [books]()
    book2.append(books.init(bookImage: #imageLiteral(resourceName: "Success Pay"), bookTitle: "Istri Salehah", pricing: "Price: Rp5.000", deposit: "Book Deposit: Rp40.000"))
    
    bookForCheckout.append(BookForCheckout.init(booksData: books1, borrowers: borrowers1))
    bookForCheckout.append(BookForCheckout.init(booksData: book2, borrowers: borrowers2))

    return bookForCheckout
}

func insertBook() -> [books] {
    var booksData = [books]()
    
    booksData.append(books.init(bookImage: #imageLiteral(resourceName: "Book2"), bookTitle: "The King of Drugs", pricing: "Price: Rp2.000", deposit: "Book Deposit: Rp20.000"))
    booksData.append(books.init(bookImage: #imageLiteral(resourceName: "Buku"), bookTitle: "Alice of Adventures", pricing: "Price: Rp3.000", deposit: "Book Deposit: Rp20.000"))
    booksData.append(books.init(bookImage: #imageLiteral(resourceName: "Success Pay"), bookTitle: "Istri Salehah", pricing: "Price: Rp5.000", deposit: "Book Deposit: Rp40.000"))
    booksData.append(books.init(bookImage: #imageLiteral(resourceName: "Book2"), bookTitle: "The King of Drugs", pricing: "Price: Rp2.000", deposit: "Book Deposit: Rp20.000"))
    booksData.append(books.init(bookImage: #imageLiteral(resourceName: "Buku"), bookTitle: "Alice of Adventures", pricing: "Price: Rp3.000", deposit: "Book Deposit: Rp20.000"))
    booksData.append(books.init(bookImage: #imageLiteral(resourceName: "Success Pay"), bookTitle: "Istri Salehah", pricing: "Price: Rp5.000", deposit: "Book Deposit: Rp40.000"))
    booksData.append(books.init(bookImage: #imageLiteral(resourceName: "Book2"), bookTitle: "The King of Drugs", pricing: "Price: Rp2.000", deposit: "Book Deposit: Rp20.000"))
    booksData.append(books.init(bookImage: #imageLiteral(resourceName: "Buku"), bookTitle: "Alice of Adventures", pricing: "Price: Rp3.000", deposit: "Book Deposit: Rp20.000"))
    booksData.append(books.init(bookImage: #imageLiteral(resourceName: "Success Pay"), bookTitle: "Istri Salehah", pricing: "Price: Rp5.000", deposit: "Book Deposit: Rp40.000"))
    
    return booksData
}
