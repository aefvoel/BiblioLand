//
//  BagVC.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 24/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class BagVC: UIViewController {
    
    @IBOutlet weak var checkoutButton: UIButton!
    @IBOutlet weak var listBag: UITableView!
    @IBOutlet weak var containerView: UIView!
    
    var dataCheckout = [BookForCheckout]()
    var state = false

    func checkState() {
        if dataCheckout.count > 0 {
            state = true
        } else {
            state = false
        }
    }
    
    func setUpView() {
        listBag.separatorStyle = .none
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        navigationItem.title = "Bag"
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1450980392, green: 0.4941176471, blue: 0.4745098039, alpha: 1)
        self.navigationController?.navigationItem.backBarButtonItem?.title = ""
        self.navigationController?.navigationBar.barTintColor = .white
        checkoutButton.greenButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        
        dataCheckout = insertData()
        
        checkState()
        
        listBag.delegate = self
        listBag.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if state == false {
            containerView.isHidden = state
            checkoutButton.isEnabled = state
            checkoutButton.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.6745098039, blue: 0.6745098039, alpha: 1)
        } else {
            containerView.isHidden = state
            listBag.reloadData()
        }
    }
    
    @IBAction func goPay(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Checkout", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "Checkout") as! CheckoutVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension BagVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if state == false {
            return 1
        } else {
            if section > (dataCheckout.count - 1) {
                return 1
            } else {
                return dataCheckout[section].booksData?.count ?? 0
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataCheckout.count + 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if state == false {
            return ""
        } else {
            if section > (dataCheckout.count - 1) {
                return "\(dataCheckout[0].borrowers!.boorowersName)'s other books"
            } else {
                return dataCheckout[section].borrowers?.boorowersName
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section > (dataCheckout.count - 1) {
            guard let cell = listBag.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as? ComponentListCell else {
                   do {fatalError("Unable to create component list table")}
               }
            cell.booksData = insertBook()
           return cell
        } else {
            guard let cell2 = listBag.dequeueReusableCell(withIdentifier: "BookCheckout", for: indexPath) as? BookCheckout else {
                do {fatalError("Unable to create component")}
            }
            
            let radius: CGFloat = 7.0
            cell2.containerView.layer.shadowColor = UIColor.black.cgColor
            cell2.containerView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            cell2.containerView.layer.shadowRadius = 4.0
            cell2.containerView.layer.shadowOpacity = 0.2
            cell2.containerView.layer.masksToBounds = false
            cell2.containerView.layer.cornerRadius = radius
            
            cell2.containerView.layer.cornerRadius = 7.0
            cell2.containerView.layer.masksToBounds = false
            
            cell2.bookImage.image = dataCheckout[indexPath.section].booksData?[indexPath.row].bookImage
            cell2.pricing.text = dataCheckout[indexPath.section].booksData?[indexPath.row].pricing
            cell2.deposit.text = dataCheckout[indexPath.section].booksData?[indexPath.row].deposit
            cell2.booksTitle.text = dataCheckout[indexPath.section].booksData?[indexPath.row].bookTitle
            cell2.borrowerNAme.text = dataCheckout[indexPath.section].borrowers?.boorowersName
            
            return cell2
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section > (dataCheckout.count - 1) {
            return 320
        } else {
            return 130
        }
    }
}
