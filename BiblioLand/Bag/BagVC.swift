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
    
    var dataCheckout = [BookForCheckout]()
    
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
        listBag.delegate = self
        listBag.dataSource = self
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        listBag.reloadData()
//    }
}

extension BagVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
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
            
            cell2.bookImage.image = UIImage(named: "Book2")
            cell2.pricing.text = "Price: Rp2.000/day"
            cell2.deposit.text = "Deposit: Rp9.000"
            cell2.booksTitle.text = "The King of Drugs"
            
            return cell2
        } else {
            guard let cell = listBag.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as? ComponentListCell else {
                do {fatalError("Unable to create component list table")}
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 130
        } else {
            return 320
        }
    }
}
