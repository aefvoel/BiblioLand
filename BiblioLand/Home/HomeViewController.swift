//
//  HomeViewController.swift
//  BiblioLand
//
//  Created by Calvin Leonardo on 21/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit
import CloudKit

class HomeViewController: UIViewController, UISearchControllerDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    var searchControllers: UISearchController!
    
    var balance = 0
    var deposit = 0
    var address: String? = ""
    @IBOutlet weak var location: UIBarButtonItem!
    
    let privateDatabase = CKContainer(identifier: "iCloud.id.appleacademy.Biblio").publicCloudDatabase
    var books = [Books]()
    var genres = [Genre]()
    
    let greenColor = UIColor(red: 0.24, green: 0.59, blue: 0.57, alpha: 1.00)
    
    func setupNavbar() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ResultTableView") as! ResultTableView
        searchControllers = UISearchController(searchResultsController: vc)
        
        searchControllers.searchResultsUpdater = vc
        searchControllers.searchBar.delegate = vc
        
        searchControllers.searchBar.barTintColor = .green

        searchControllers.delegate = self
        self.definesPresentationContext = true

        searchControllers.hidesNavigationBarDuringPresentation = true
        searchControllers.searchBar.placeholder = "Search Book Title, Author or Lender Name"
        searchControllers.searchBar.sizeToFit()

        navigationItem.searchController = searchControllers

        searchControllers.searchBar.tintColor = UIColor.white
        searchControllers.searchBar.searchBarStyle = .minimal
        searchControllers.searchBar.searchTextField.backgroundColor = UIColor.white
        searchControllers.searchBar.searchTextField.font = .systemFont(ofSize: 12.0)

        navigationItem.hidesSearchBarWhenScrolling = false

        navigationController?.navigationBar.barTintColor = greenColor
    }
    
    func retrieveUser(){
        if let userCloudID = UserDefaults.standard.string(forKey: "userID") {
            let recordID = CKRecord.ID(recordName: userCloudID)
            privateDatabase.fetch(withRecordID: recordID) { (fetchedRecord, error) in
                if error == nil {
                    self.balance = fetchedRecord?["balance"] as! Int
                    self.deposit = fetchedRecord?["deposit"] as! Int
                    self.address = fetchedRecord?["address"]
                    //TODO
                } else {
                    print(error?.localizedDescription)
                }
            }
        }
    }
    func retrieveData(){
        let predicate = NSPredicate(value: true)
            
        let query = CKQuery(recordType: "books", predicate: predicate)
//        query.sortDescriptors = [NSSortDescriptor(key: "modificationDate", ascending: false)]
            
        let operation = CKQueryOperation(query: query)
        operation.desiredKeys = ["title","category", "price_per_day", "photo"]
            
        operation.recordFetchedBlock = { record in
            
            let photo = record["photo"] as! CKAsset
            let data = try? Data(contentsOf: photo.fileURL!)
            let price = (record["price_per_day"] as! NSNumber).stringValue
            self.books.append(Books(bookId: record.recordID.recordName, bookTitle: record["title"]!, bookPrice: "Rp. \(price)", bookImg: UIImage(data: data!)!))
            self.genres.append(Genre(genreName: record["category"]!))
                
        }
            
        operation.queryCompletionBlock = { cursor, error in
                
            DispatchQueue.main.async {
                    
                if error == nil {
                    self.table.reloadData()
                } else {
                    print(error!.localizedDescription)
                }
                    
            }
                
        }
            
        privateDatabase.add(operation)
            
    
    }
    
    @IBAction func goToCart(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Bag", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CartVC") as! BagVC
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
//    func insertData(){
//        books.append(Books(bookTitle: "Queen's Peril Book 1", bookPrice: "Rp 1000", bookImg: UIImage(named: "queensperil.jpg")!))
//        books.append(Books(bookTitle: "Queen's Peril Book 2", bookPrice: "Rp 1500", bookImg: UIImage(named: "queensperil.jpg")!))
//        books.append(Books(bookTitle: "Queen's Peril Book 3", bookPrice: "Rp 2000", bookImg: UIImage(named: "queensperil.jpg")!))
//        books.append(Books(bookTitle: "Queen's Peril Book 4", bookPrice: "Rp 2500", bookImg: UIImage(named: "queensperil.jpg")!))
//        books.append(Books(bookTitle: "Queen's Peril Book 5", bookPrice: "Rp 3000", bookImg: UIImage(named: "queensperil.jpg")!))
//        books.append(Books(bookTitle: "Queen's Peril Book 6", bookPrice: "Rp 3500", bookImg: UIImage(named: "queensperil.jpg")!))
//        books.append(Books(bookTitle: "Queen's Peril Book 7", bookPrice: "Rp 4000", bookImg: UIImage(named: "queensperil.jpg")!))
//        books.append(Books(bookTitle: "Queen's Peril Book 8", bookPrice: "Rp 4500", bookImg: UIImage(named: "queensperil.jpg")!))
//
//        genres.append(Genre(genreName: "All Genre"))
//        genres.append(Genre(genreName: "Business"))
//        genres.append(Genre(genreName: "Fiction"))
//        genres.append(Genre(genreName: "Fantasy"))
//        genres.append(Genre(genreName: "Mistery"))
//        genres.append(Genre(genreName: "Romance"))
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavbar()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(BookTableViewCell.nib(), forCellReuseIdentifier: BookTableViewCell.identifier)
        table.register(AllBookTableViewCell.nib(), forCellReuseIdentifier: AllBookTableViewCell.identifier)
        table.register(AllGenreTableViewCell.nib(), forCellReuseIdentifier: AllGenreTableViewCell.identifier)

        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        
        retrieveData()
        retrieveUser()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section != 4{
            
        }
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 180))

        let label = UILabel()
        label.frame = CGRect.init(x: 20, y: 0, width: headerView.frame.width-10, height: headerView.frame.height-150)
        label.font = UIFont.boldSystemFont(ofSize: 17.0)

        headerView.addSubview(label)
        
        headerView.backgroundColor = .clear
        
//        switch section {
//        case 1:
//            <#code#>
//        default:
//            <#code#>
//        }

        if section == 1{
            label.text = "Reccommended for You"

        } else if section == 2{
            label.text = "Popular Books"

        } else if section == 3{
            label.text = "All Books near You"
        }else if section == 4{
            return nil
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = table.dequeueReusableCell(withIdentifier: "walletCell", for: indexPath) as! WalletCell
            cell.selectionStyle = .none
           
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
            cell.layer.shadowOpacity = 0.2
            cell.layer.shadowOffset = .zero
            cell.layer.shadowRadius = 5
            
            cell.textBalance.text = "Rp. \(balance)"
            cell.textDeposit.text = "Rp. \(deposit)"
            
            self.location.title = address
            
            return cell
        } else if indexPath.section == 3 {
            let cell = table.dequeueReusableCell(withIdentifier: AllGenreTableViewCell.identifier, for: indexPath ) as! AllGenreTableViewCell
            cell.configure(with: genres)
                
            return cell
        } else if indexPath.section == 4 {
            let cell = table.dequeueReusableCell(withIdentifier: AllBookTableViewCell.identifier, for: indexPath ) as! AllBookTableViewCell
            cell.configure(with: books)
            
            cell.didSelectItemAction = { [weak self] indexPath in
                self?.performSegue(withIdentifier: "BookDetailsSegue", sender: self)
            }
                
            return cell
        } else {
            let cell = table.dequeueReusableCell(withIdentifier: BookTableViewCell.identifier, for: indexPath ) as! BookTableViewCell
            cell.configure(with: books)
            
            cell.didSelectItemAction = { [weak self] indexPath in
                self?.performSegue(withIdentifier: "BookDetailsSegue", sender: self)
            }
                
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 94
        } else if indexPath.section == 3{
            return 39
        }else if indexPath.section == 4{
            return 780
        } else {
            return 300
        }
    }
    
}

struct Books {
    var bookId: String
    var bookTitle: String
    var bookPrice: String
    var bookImg: UIImage
    
    init(bookId: String, bookTitle: String, bookPrice: String, bookImg: UIImage) {
        self.bookTitle = bookTitle
        self.bookPrice = bookPrice
        self.bookImg = bookImg
        self.bookId = bookId
    }
}

struct Genre {
    let genreName: String
    
    init(genreName: String) {
        self.genreName = genreName
    }
}

class WalletCell: UITableViewCell {
    @IBOutlet weak var textBalance: UILabel!
    @IBOutlet weak var textDeposit: UILabel!
}
