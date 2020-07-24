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
    
    func setUpView() {
        PayProccess.greenButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
}
