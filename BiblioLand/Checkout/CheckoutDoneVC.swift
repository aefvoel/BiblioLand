//
//  ChecloutDoneVC.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 24/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class CheckoutDoneVC: UIViewController {

    @IBOutlet weak var topSection: UIView!
    @IBOutlet weak var bottomSection: UIView!
    @IBOutlet weak var pickupDate: UILabel!
    @IBOutlet weak var deliveryMethod: UILabel!
    @IBOutlet weak var buttonBorrowingDetails: UIButton!
    
    func setUpView() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        navigationItem.title = "Payment Success"
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1450980392, green: 0.4941176471, blue: 0.4745098039, alpha: 1)
        self.navigationController?.navigationItem.backBarButtonItem?.title = ""
        self.navigationController?.navigationBar.barTintColor = .white
        
        buttonBorrowingDetails.greenButton()
        topSection.roundedView()
        bottomSection.roundedView()
        
        pickupDate.text = "12 Agustus 2020"
        deliveryMethod.text = "Ojek DQ Same Day"
    }
    
    @IBAction func toDetail(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CurrentBorrowing", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
}
