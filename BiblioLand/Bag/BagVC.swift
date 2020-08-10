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
        
        let nibCell = UINib(nibName: "TableViewCell", bundle: nil)
        listBag.register(nibCell, forCellReuseIdentifier: "BookCheckout")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        
        dataCheckout = insertData()
        
        checkState()
        
        listBag.delegate = self
        listBag.dataSource = self
    }
    
    func isNoCart() {
        if state == false {
            containerView.isHidden = state
            checkoutButton.isEnabled = state
            checkoutButton.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.6745098039, blue: 0.6745098039, alpha: 1)
        } else {
            containerView.isHidden = state
            listBag.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        isNoCart()
    }
    
    func openTapped() {
        let ac = UIAlertController(title: "Choose books you want to borrow", message: nil, preferredStyle: .actionSheet)
        for data in dataCheckout {
            ac.addAction(UIAlertAction(title: data.borrowers?.boorowersName, style: .default, handler: {
                (alert: UIAlertAction!) in
                    let storyboard = UIStoryboard(name: "Checkout", bundle: nil)
                    let vc = storyboard.instantiateViewController(identifier: "Checkout") as! CheckoutVC
                    vc.data = data.booksData!
                    self.navigationController?.pushViewController(vc, animated: true)
            }))
        }
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    @IBAction func goPay(_ sender: Any) {
        if dataCheckout.count == 1 {
            let storyboard = UIStoryboard(name: "Checkout", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "Checkout") as! CheckoutVC
            vc.data = dataCheckout[0].booksData!
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            openTapped()
        }
    }
}

extension BagVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = .white

        var data = ""
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)

        if (section == (dataCheckout.count) && (dataCheckout.count > 0)) {
            data = "\(dataCheckout[0].borrowers!.boorowersName)'s other books"
        } else if (dataCheckout.count > 0) {
            data = "Borrow From \(dataCheckout[section].borrowers!.boorowersName)"
        }

        label.text = data
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = UIColor.black

        headerView.addSubview(label)

        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
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
            if section == (dataCheckout.count) {
                return "\(dataCheckout[0].borrowers!.boorowersName)'s other books"
            } else {
                return "Borrow From \(dataCheckout[section].borrowers!.boorowersName)"
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section > (dataCheckout.count - 1) {
            guard let cell = listBag.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as? ComponentListCell else {
                   do {fatalError("Unable to create component list table")}
               }
            if dataCheckout.count > 0 {
                guard let books = dataCheckout[0].booksData else { return cell }
                cell.booksData = books
            }
            return cell
        } else {
            guard let cell2 = listBag.dequeueReusableCell(withIdentifier: "BookCheckout", for: indexPath) as? BookCheckout else {
                do {fatalError("Unable to create component")}
            }
            
            let price = idrFormat(harga: dataCheckout[indexPath.section].booksData![indexPath.row].pricing!)
            let deposit = idrFormat(harga: dataCheckout[indexPath.section].booksData![indexPath.row].deposit!)
            

            cell2.bookImage.image = dataCheckout[indexPath.section].booksData?[indexPath.row].bookImage
            cell2.pricing.text = "Price: Rp\(price)"
            cell2.deposit.text = "Book Deposit: Rp\(deposit)"
            cell2.booksTitle.text = dataCheckout[indexPath.section].booksData?[indexPath.row].bookTitle
            
            cell2.delegate = self
            cell2.rows = indexPath.row
            cell2.section = indexPath.section
            
            return cell2
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section > (dataCheckout.count - 1) {
            return 320
        } else {
            if (dataCheckout[indexPath.section].booksData!.count) > 1 {
                return 100
            } else {
                return 120
            }
        }
    }
}

extension BagVC: CellDelegate {
    func DeleteBooks(_ bookCheckout: BookCheckout, booksYouWantDelete section: Int, row: Int) {
        if dataCheckout[section].booksData?.count == 1 {
            dataCheckout[section].booksData?.remove(at: row)
            dataCheckout.remove(at: section)
        } else {
            dataCheckout[section].booksData?.remove(at: row)
        }
                
        if dataCheckout.count > 0 {
            listBag.reloadData()
        } else {
            listBag.reloadData()
            state = false
            self.viewWillAppear(true)
        }
    }
}
