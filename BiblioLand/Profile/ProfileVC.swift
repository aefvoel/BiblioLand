//
//  ProfileVC.swift
//  BiblioLand
//
//  Created by Salicca Dewi Rahajeng on 06/08/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ProfileTable: UITableView!
    
    var bookWishlist = [BookWishlist]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewReview()
        setupViewWishlist()
        insertData()
        
        ProfileTable.delegate = self
        ProfileTable.dataSource = self
        ProfileTable.separatorStyle = .none
        
        
        // Do any additional setup after loading the view.
    }
    
    func insertData(){
        bookWishlist.append(BookWishlist(bookTitle: "Queen's Peril Book 1", bookImg: UIImage(named: "queensperil.jpg")!))
        bookWishlist.append(BookWishlist(bookTitle: "Queen's Peril Book 2", bookImg: UIImage(named: "queensperil.jpg")!))
        bookWishlist.append(BookWishlist(bookTitle: "Queen's Peril Book 3", bookImg: UIImage(named: "queensperil.jpg")!))
    }
    
    func setupViewReview(){
        let nib = UINib(nibName: "ReviewCell", bundle: nil)
        ProfileTable.register(nib, forCellReuseIdentifier: "ReviewCell")
    }
    
    func setupViewWishlist(){
        let nib = UINib(nibName: "WishlistCell", bundle: nil)
        ProfileTable.register(nib, forCellReuseIdentifier: "WishlistCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 180))

        let label = UILabel()
        label.frame = CGRect.init(x: 20, y: 0, width: headerView.frame.width-10, height: headerView.frame.height-150)
        label.font = UIFont.boldSystemFont(ofSize: 17.0)

        headerView.addSubview(label)
        
        headerView.backgroundColor = .clear
        
        if section == 1{
            label.text = "Wishlist"
        } else if section == 2{
            label.text = "Review From Lender"
        } else{
            return nil
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = ProfileTable.dequeueReusableCell(withIdentifier: "ProfileInfoCell", for: indexPath)
             cell.selectionStyle = .none
            
             cell.layer.shadowColor = UIColor.black.cgColor
             cell.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
             cell.layer.shadowOpacity = 0.2
             cell.layer.shadowOffset = .zero
             cell.layer.shadowRadius = 5
             
             return cell
        }
        else if indexPath.section == 1{
            let cell = ProfileTable.dequeueReusableCell(withIdentifier: WishlistCell.identifier, for: indexPath) as! WishlistCell
            
            cell.bookWishlist = bookWishlist
            return cell
        }
        else{
            let cell = ProfileTable.dequeueReusableCell(withIdentifier: ReviewCell.identifier, for: indexPath) as! ReviewCell
            return cell
        }
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 350
        } else if indexPath.section == 1{
            return 300
        } else {
            return 300
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

struct BookWishlist{
    let bookTitle: String
    let bookImg: UIImage
    
    init(bookTitle: String, bookImg: UIImage){
        self.bookTitle = bookTitle
        self.bookImg = bookImg
    }
}

struct Profile {
    let profileImg: UIImage
    let profileName: String
    let profileLocation: String
    let profileBorrow: String
    let profileRating: String
    let profileOntime: String
    
    init(profileImg: UIImage, profileName: String, profileLocation: String, profileBorrow: String, profileRating: String, profileOntime: String){
        self.profileImg = profileImg
        self.profileName = profileName
        self.profileLocation = profileLocation
        self.profileBorrow = profileBorrow
        self.profileRating = profileRating
        self.profileOntime = profileOntime
    }
}

class ProfileInfo: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileNameLbl: UILabel!
    @IBOutlet weak var profileLocationLbl: UILabel!
    @IBOutlet weak var profileBorrowLbl: UILabel!
    @IBOutlet weak var profileRatingLbl: UILabel!
    @IBOutlet weak var profileOntimeLbl: UILabel!
    
    
}
