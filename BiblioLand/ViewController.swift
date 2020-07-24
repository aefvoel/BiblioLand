//
//  ViewController.swift
//  BiblioLand
//
//  Created by Toriq Wahid Syaefullah on 17/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func go(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Checkout", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CheckoutDoneVC") as! CheckoutDoneVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
