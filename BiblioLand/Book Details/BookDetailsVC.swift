//
//  BookDetailsVC.swift
//  BiblioLand
//
//  Created by Salicca Dewi Rahajeng on 28/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit
import CloudKit

class BookDetailsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var bookDetailsTable: UITableView!
    let privateDatabase = CKContainer(identifier: "iCloud.id.appleacademy.Biblio").publicCloudDatabase
    
    var bookInfo = BookInfo()
    var seeMoreisClicked = false
    
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
        
        retrieveData()
        // Do any additional setup after loading the view.
    }
    
    func retrieveData(){
        
        if let bookID = UserDefaults.standard.string(forKey: "bookID") {
            let recordID = CKRecord.ID(recordName: bookID)
            privateDatabase.fetch(withRecordID: recordID) { (fetchedRecord, error) in
                if error == nil {
                    let photo = fetchedRecord?["photo"] as! CKAsset
                    let data = try? Data(contentsOf: photo.fileURL!)
                    
                    self.bookInfo.bookTitle = fetchedRecord?["title"] as! String
                    self.bookInfo.bookAuthor = fetchedRecord?["author"] as! String
                    self.bookInfo.bookImage = UIImage(data: data!)!
                    self.bookInfo.bookPrice = fetchedRecord?["price_per_day"] as! Int
                    self.bookInfo.bookDeposit = fetchedRecord?["price_deposit"] as! Int
                    self.bookInfo.bookSynopsis = fetchedRecord?["desc"] as! String
                    self.bookDetailsTable.reloadData()
                    //TODO
                } else {
                    print(error?.localizedDescription)
                }
            }
        }
        
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
            
            let cell = bookDetailsTable.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! bookInfoCell
            cell.selectionStyle = .none
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
            cell.layer.shadowOpacity = 0.2
            cell.layer.shadowOffset = .zero
            cell.layer.shadowRadius = 5
            
            cell.bookAuthorLbl.text = bookInfo.bookAuthor
            cell.bookTitleLbl.text = bookInfo.bookTitle
            cell.bookImg.image = bookInfo.bookImage
            cell.bookPriceLbl.text = "Rp. \(bookInfo.bookPrice)"
            cell.bookDepositLbl.text = "Rp. \(bookInfo.bookDeposit)"
            return cell
        }
        else  if indexPath.section == 1 {
            
            let cell = bookDetailsTable.dequeueReusableCell(withIdentifier: SynopsisLenderNotesCell.identifier, for: indexPath) as! SynopsisLenderNotesCell
            cell.selectionStyle = .none
            cell.descriptionTxtView.text = bookInfo.bookSynopsis
            
            return cell
        }
        else  if indexPath.section == 2 {
            
            let cell = bookDetailsTable.dequeueReusableCell(withIdentifier: SynopsisLenderNotesCell.identifier, for: indexPath) as! SynopsisLenderNotesCell
            cell.selectionStyle = .none
            cell.descriptionTxtView.text = bookInfo.bookSynopsis
            
            return cell
        }
        else if indexPath.section == 3{
            
            let cell = bookDetailsTable.dequeueReusableCell(withIdentifier: LenderCell.identifier, for: indexPath) as! LenderCell
            cell.selectionStyle = .none
            
            return cell
        }
        else {
            
            let cell = bookDetailsTable.dequeueReusableCell(withIdentifier: ButtonCell.identifier, for: indexPath) as! ButtonCell
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 500
        } else if indexPath.section == 3{
            return 150
        } else if indexPath.section == 4{
            if seeMoreisClicked == true{
                return 100
            } else {
                return 70
            }
        }else{
            return 150
        }
    }
    
    
}

struct BookInfo{
    var bookTitle: String = ""
    var bookAuthor: String = ""
    var bookImage: UIImage = UIImage.init(named: "Book2")!
    let bookLanguage: String = ""
    let bookCondition: String = ""
    let bookPages: String = ""
    let bookEdition: String = ""
    var bookPrice: Int = 0
    var bookDeposit: Int = 0
    var bookSynopsis: String = ""
    var bookNotes: String = ""
    
}

class bookInfoCell: UITableViewCell{
    
    @IBOutlet weak var bookImg: UIImageView!
    @IBOutlet weak var bookTitleLbl: UILabel!
    @IBOutlet weak var bookAuthorLbl: UILabel!
    @IBOutlet weak var bookLanguageLbl: UILabel!
    @IBOutlet weak var bookConditionLbl: UILabel!
    @IBOutlet weak var bookPagesLbl: UILabel!
    @IBOutlet weak var bookEditionLbl: UILabel!
    @IBOutlet weak var bookPriceLbl: UILabel!
    @IBOutlet weak var bookDepositLbl: UILabel!
    
    
    
}
