//
//  HomeViewController.swift
//  BiblioLand
//
//  Created by Calvin Leonardo on 21/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    var books = [Books]()
    var genres = [Genre]()
    
    let greenColor = UIColor(red: 0.24, green: 0.59, blue: 0.57, alpha: 1.00)
    
    func setupNavbar() {
        let searchController = UISearchController(searchResultsController: nil)
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Book Title, Author or Lender Name"
        navigationItem.searchController = searchController
        definesPresentationContext = true

        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.searchTextField.backgroundColor = UIColor.white
        searchController.searchBar.searchTextField.font = .systemFont(ofSize: 12.0)
//        searchController.searchBar.setShowsCancelButton(false, animated: true)
        
        navigationItem.hidesSearchBarWhenScrolling = false
        
        navigationController?.navigationBar.barTintColor = greenColor
    }
    @IBAction func goToCart(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Bag", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CartVC") as! BagVC
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func insertData(){
        books.append(Books(bookTitle: "Queen's Peril Book 1", bookPrice: "Rp 1000", bookImg: UIImage(named: "queensperil.jpg")!))
        books.append(Books(bookTitle: "Queen's Peril Book 2", bookPrice: "Rp 1500", bookImg: UIImage(named: "queensperil.jpg")!))
        books.append(Books(bookTitle: "Queen's Peril Book 3", bookPrice: "Rp 2000", bookImg: UIImage(named: "queensperil.jpg")!))
        books.append(Books(bookTitle: "Queen's Peril Book 4", bookPrice: "Rp 2500", bookImg: UIImage(named: "queensperil.jpg")!))
        books.append(Books(bookTitle: "Queen's Peril Book 5", bookPrice: "Rp 3000", bookImg: UIImage(named: "queensperil.jpg")!))
        books.append(Books(bookTitle: "Queen's Peril Book 6", bookPrice: "Rp 3500", bookImg: UIImage(named: "queensperil.jpg")!))
        books.append(Books(bookTitle: "Queen's Peril Book 7", bookPrice: "Rp 4000", bookImg: UIImage(named: "queensperil.jpg")!))
        books.append(Books(bookTitle: "Queen's Peril Book 8", bookPrice: "Rp 4500", bookImg: UIImage(named: "queensperil.jpg")!))
        
        genres.append(Genre(genreName: "All Genre"))
        genres.append(Genre(genreName: "Business"))
        genres.append(Genre(genreName: "Fiction"))
        genres.append(Genre(genreName: "Fantasy"))
        genres.append(Genre(genreName: "Mistery"))
        genres.append(Genre(genreName: "Romance"))
    }
    
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
        
        insertData()
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
            let cell = table.dequeueReusableCell(withIdentifier: "walletCell", for: indexPath)
            cell.selectionStyle = .none
           
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
            cell.layer.shadowOpacity = 0.2
            cell.layer.shadowOffset = .zero
            cell.layer.shadowRadius = 5
            
            return cell
        } else if indexPath.section == 3 {
            let cell = table.dequeueReusableCell(withIdentifier: AllGenreTableViewCell.identifier, for: indexPath ) as! AllGenreTableViewCell
            cell.configure(with: genres)
                
            return cell
        } else if indexPath.section == 4 {
            let cell = table.dequeueReusableCell(withIdentifier: AllBookTableViewCell.identifier, for: indexPath ) as! AllBookTableViewCell
            cell.configure(with: books)
                
            return cell
        } else {
            let cell = table.dequeueReusableCell(withIdentifier: BookTableViewCell.identifier, for: indexPath ) as! BookTableViewCell
            cell.configure(with: books)
                
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
    let bookTitle: String
    let bookPrice: String
    let bookImg: UIImage
    
    init(bookTitle: String, bookPrice: String, bookImg: UIImage) {
        self.bookTitle = bookTitle
        self.bookPrice = bookPrice
        self.bookImg = bookImg
    }
}

struct Genre {
    let genreName: String
    
    init(genreName: String) {
        self.genreName = genreName
    }
}
