//
//  CheckoutVC.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 24/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class CheckoutVC: UIViewController {

    @IBOutlet weak var PayProccess: UIButton!
    @IBOutlet weak var listCheckout: UITableView!
    
    var data = [books]()
    var borrowers = "DQ"
    var creator = "Dicky Geraldi"
    
    var totalPick = 0
    var totalFee = 0
            
    func registeringUINib() {
        let nibBorrowCell = UINib(nibName: "BorrowBooksCell", bundle: nil)
        listCheckout.register(nibBorrowCell, forCellReuseIdentifier: "BorrowBooksCell")
        
        let nibCell = UINib(nibName: "TotalPay", bundle: nil)
        listCheckout.register(nibCell, forCellReuseIdentifier: "TotalPay")
        
        let nibPayment = UINib(nibName: "PaymentMethod", bundle: nil)
        listCheckout.register(nibPayment, forCellReuseIdentifier: "PaymentMethod")
        
        let nibPicker = UINib(nibName: "PickingDate", bundle: nil)
        listCheckout.register(nibPicker, forCellReuseIdentifier: "PickingDate")
        
        let nibLocation = UINib(nibName: "BooksLocation", bundle: nil)
        listCheckout.register(nibLocation, forCellReuseIdentifier: "BooksLocation")
    }
    
    func setUpView() {
        PayProccess.greenButton()
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        navigationItem.title = "Checkout"
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1450980392, green: 0.4941176471, blue: 0.4745098039, alpha: 1)
        self.navigationController?.navigationItem.backBarButtonItem?.title = ""
        self.navigationController?.navigationBar.barTintColor = .white
        
        listCheckout.separatorStyle = .none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setUpView()
        registeringUINib()
        initializeHideKeyboard()
        
        listCheckout.delegate = self
        listCheckout.dataSource = self
    }
    
    @IBAction func payProcess(_ sender: Any) {
        let index = IndexPath(row: data.count, section: 0)
        let cell: PickingDate = self.listCheckout.cellForRow(at: index) as! PickingDate
        
        let index2 = IndexPath(row: data.count+1, section: 0)
        let cell2: BooksLocation = self.listCheckout.cellForRow(at: index2) as! BooksLocation
        
        let index3 = IndexPath(row: data.count+2, section: 0)
        let cell3: PaymentMethod = self.listCheckout.cellForRow(at: index3) as! PaymentMethod
                
        if cell.startDatePick.text == "" || cell.endDatePick.text == "" || cell2.deliveryMethod.text == "" || cell2.pickupTime.text == "" || cell3.choosePayment.text == "" {
            let alert = showAlert(message: "All data must be filled")
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Confirmation", message: "Are you sure want to buy this books", preferredStyle: .alert)
                    
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: {(UIAlertAction) -> Void in }))
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(UIAlertAction) -> Void in
                let storyboard = UIStoryboard(name: "Checkout", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "CheckoutDoneVC") as! CheckoutDoneVC
                vc.deliveryMethods = cell2.deliveryMethod.text!
                vc.pickupDates = cell.startDatePick.text!
                vc.pickupTime = cell2.pickupTime.text!
                
                self.navigationController?.pushViewController(vc, animated: true)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension CheckoutVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count + 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let booksCount = data.count

        if indexPath.row < booksCount {
            guard let cell = listCheckout.dequeueReusableCell(withIdentifier: "BorrowBooksCell", for: indexPath) as? BorrowBooksCell else {
                do {fatalError("Unable to create component")}
            }
            
            cell.bookDeposit.text = "Rp\(idrFormat(harga: data[indexPath.row].deposit!))"
            cell.bookImage.image = data[indexPath.row].bookImage
            cell.bookPrice.text = "Rp\(idrFormat(harga: data[indexPath.row].pricing!))"
            cell.bookTitle.text = data[indexPath.row].bookTitle
            cell.booksBorrowers.text = borrowers
            cell.booksCreator.text = creator
            
            return cell
        } else if indexPath.row == (booksCount) {
            guard let cell = listCheckout.dequeueReusableCell(withIdentifier: "PickingDate", for: indexPath) as? PickingDate else {
                do {fatalError("Unable to create component")}
            }
            
            for book in data {
                cell.harga.append(book.pricing!)
            }
            
            cell.delegate = self
            return cell
        } else if indexPath.row == (booksCount + 1) {
            guard let cell = listCheckout.dequeueReusableCell(withIdentifier: "BooksLocation", for: indexPath) as? BooksLocation else {
                do {fatalError("Unable to create component")}
            }
            
            cell.delegate = self
            return cell
        } else if indexPath.row == (booksCount + 2) {
            guard let cell = listCheckout.dequeueReusableCell(withIdentifier: "PaymentMethod", for: indexPath) as? PaymentMethod else {
                do {fatalError("Unable to create component")}
            }
            
            return cell
        }
        if indexPath.row == (booksCount + 3) {
            guard let cell = listCheckout.dequeueReusableCell(withIdentifier: "TotalPay", for: indexPath) as? TotalPay else {
                do {fatalError("Unable to create component")}
            }
            
            cell.totalPay.text = "Rp0"
            return cell
        }
        return UITableViewCell(style: .default, reuseIdentifier: "")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row < data.count {
            return 181
        } else if indexPath.row == data.count {
            return 185
        } else if indexPath.row == data.count + 1 {
            return 355
        } else if indexPath.row == data.count + 2 {
            return 70
        } else if indexPath.row == data.count + 3 {
            return 70
        } else {
            return 0
        }
    }
}

extension CheckoutVC: UpdateTotal {
    
    func UpdateTotal(sender: UITableViewCell, totalPick: Int, totalFee: Int) {
        let index4 = IndexPath(row: data.count + 3, section: 0)
        let cell4: TotalPay = listCheckout.cellForRow(at: index4) as! TotalPay
        
        let checkData = cell4.totalPay.text

        if checkData == "Rp0" {
            cell4.totalPay.text = "Rp\(idrFormat(harga: totalPick + totalFee))"
        } else {
//            let newStr = checkData!.index(checkData!.startIndex, offsetBy: 2)
//            let amountData = checkData!.suffix(from: newStr)
            
//            let amount = Int("\(amountData.replacingOccurrences(of: ".", with: ""))")
            
            if self.totalFee != totalFee {
                self.totalFee = totalFee
            }
            
            if self.totalPick != totalPick && totalPick > 0 {
                self.totalPick = totalPick
            }
            
            let sumAmount = self.totalFee + self.totalPick
            
            cell4.totalPay.text = "Rp\(idrFormat(harga: sumAmount))"
        }
    }
    
    func initializeHideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
    
}
