//
//  BookDetailsVC.swift
//  BiblioLand
//
//  Created by Salicca Dewi Rahajeng on 28/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class BookDetailsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var bookDetailsTable: UITableView!
    
    var bookInfo = [BookInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewSynLenderNotes()
        setupViewLender()
        setupViewButton()
        
        bookDetailsTable.delegate = self
        bookDetailsTable.dataSource = self
        bookDetailsTable.separatorStyle = .none
        
        
        //supaya mau dynamic but still not working
        bookDetailsTable.rowHeight = UITableView.automaticDimension
        bookDetailsTable.estimatedRowHeight = 600

        // Do any additional setup after loading the view.
    }
    
    func setupViewSynLenderNotes(){
        let nib = UINib(nibName: "SynopsisLenderNotesCell", bundle: nil)
        bookDetailsTable.register(nib, forCellReuseIdentifier: "SynopsisLenderNotesCell")
        
    }
    
    func setupViewLender(){
        let nib = UINib(nibName: "LenderCell", bundle: nil)
        bookDetailsTable.register(nib, forCellReuseIdentifier: "LenderCell")
    }
    
    func setupViewButton(){
        let nib = UINib(nibName: "ButtonCell", bundle: nil)
        bookDetailsTable.register(nib, forCellReuseIdentifier: "ButtonCell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 180))
        
        let label = UILabel()
        label.frame = CGRect.init(x: 20, y: 0, width: headerView.frame.width-10, height: headerView.frame.height-150)
        label.font = UIFont.boldSystemFont(ofSize: 17.0)

        headerView.addSubview(label)
        
        headerView.backgroundColor = .clear
        
        if section == 1 {
            label.text = "Synopsis"
        }
        else if section == 2 {
            label.text = "Lender's Notes"
        }
        else {
            return nil
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            
            let cell = bookDetailsTable.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
            cell.selectionStyle = .none
            
             cell.layer.shadowColor = UIColor.black.cgColor
             cell.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
             cell.layer.shadowOpacity = 0.2
             cell.layer.shadowOffset = .zero
             cell.layer.shadowRadius = 5
            return cell
        }
        else if indexPath.section == 3{

            let cell = bookDetailsTable.dequeueReusableCell(withIdentifier: LenderCell.identifier, for: indexPath) as! LenderCell
            return cell
        }
        else if indexPath.section == 4{
            
            let cell = bookDetailsTable.dequeueReusableCell(withIdentifier: ButtonCell.identifier, for: indexPath) as! ButtonCell
            return cell
        }
        else {
            
            let cell = bookDetailsTable.dequeueReusableCell(withIdentifier: SynopsisLenderNotesCell.identifier, for: indexPath) as! SynopsisLenderNotesCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 500
        } else if indexPath.section == 3{
            return 150
        } else if indexPath.section == 4{
            return 100
        }else{
            return 150
        }
    }
    


}

struct BookInfo{
    let bookTitle: String
    let bookAuthor: String
    let bookImage: UIImage
    let bookLanguage: String
    let bookCondition: String
    let bookPages: String
    let bookEdition: String
    let bookPrice: String
    let bookDeposit: String
    let bookSynopsis: String
    let bookNotes: String
    
    init(bookTitle: String, bookAuthor: String, bookImage: UIImage, bookLanguage: String, bookCondition: String, bookPages: String, bookEdition: String, bookPrice: String, bookDeposit: String, bookSynopsis: String, bookNotes: String) {
        self.bookTitle = bookTitle
        self.bookAuthor = bookAuthor
        self.bookImage = bookImage
        self.bookLanguage = bookLanguage
        self.bookCondition = bookCondition
        self.bookPages = bookPages
        self.bookEdition = bookEdition
        self.bookPrice = bookPrice
        self.bookDeposit = bookDeposit
        self.bookSynopsis = bookSynopsis
        self.bookNotes = bookNotes
    }
}
