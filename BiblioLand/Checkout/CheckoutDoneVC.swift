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
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var labelDelivery: UILabel!
    
    var pickupDates: String?
    var deliveryMethods: String?
    var pickupTime: String?
    
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
        
        pickupDate.text = pickupDates!
        
        if deliveryMethods!.contains("Ojek") == true {
            textLabel.isHidden = false
            deliveryMethod.text = deliveryMethods!
            labelDelivery.text = "Delivery Method"
        } else {
            textLabel.isHidden = true
            deliveryMethod.text = pickupTime!
            labelDelivery.text = "Pickup Time"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
}
