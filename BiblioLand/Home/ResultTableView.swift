//
//  ResultTableView.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 07/08/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class ResultTableView: UIViewController, UISearchResultsUpdating, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var books = [Books]()
    var bookFiletring = [Books]()
    
    @IBOutlet weak var datanya: UITableView!
    
    func insertData(){
        books.append(Books(bookTitle: "Queen's Peril Book 1", bookPrice: "Rp 1000", bookImg: UIImage(named: "queensperil.jpg")!))
        books.append(Books(bookTitle: "Queen's Peril Book 2", bookPrice: "Rp 1500", bookImg: UIImage(named: "queensperil.jpg")!))
        books.append(Books(bookTitle: "Queen's Peril Book 3", bookPrice: "Rp 2000", bookImg: UIImage(named: "queensperil.jpg")!))
        books.append(Books(bookTitle: "Queen's Peril Book 4", bookPrice: "Rp 2500", bookImg: UIImage(named: "queensperil.jpg")!))
        books.append(Books(bookTitle: "Queen's Peril Book 5", bookPrice: "Rp 3000", bookImg: UIImage(named: "queensperil.jpg")!))
        books.append(Books(bookTitle: "Queen's Peril Book 6", bookPrice: "Rp 3500", bookImg: UIImage(named: "queensperil.jpg")!))
        books.append(Books(bookTitle: "Queen's Peril Book 7", bookPrice: "Rp 4000", bookImg: UIImage(named: "queensperil.jpg")!))
        books.append(Books(bookTitle: "Queen's Peril Book 8", bookPrice: "Rp 4500", bookImg: UIImage(named: "queensperil.jpg")!))
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        bookFiletring.removeAll()
        
        if let text = searchController.searchBar.text {
            bookFiletring = books.filter({ (books) -> Bool in
                return (books.bookTitle.lowercased().contains(text.lowercased()))
            })
        }
        
        datanya.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        insertData()
        datanya.separatorStyle = .none
        
        datanya.delegate = self
        datanya.dataSource = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookFiletring.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = datanya.dequeueReusableCell(withIdentifier: "Resultnya", for: indexPath) as! ResultnyaTBC

        cell.bookImage.image = bookFiletring[indexPath.row].bookImg
        cell.bookTitle.text = bookFiletring[indexPath.row].bookTitle
        cell.bookPricing.text = bookFiletring[indexPath.row].bookPrice
        cell.borrowFrom.text = "Borrow From DQ"
        cell.booksStatus.text = "Available"

        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        bookFiletring.removeAll()
        
        if let text = searchBar.text {
            bookFiletring = books.filter({ (books) -> Bool in
                return (books.bookTitle.lowercased().contains(text.lowercased()))
            })
        }
        
        datanya.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        bookFiletring.removeAll()
        datanya.reloadData()
    }
    
//    q
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
