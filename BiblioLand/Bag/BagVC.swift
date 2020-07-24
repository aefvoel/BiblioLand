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
    
    func setUpView() {
        checkoutButton.greenButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
    }
}
