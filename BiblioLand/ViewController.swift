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
//        onStartViewController()
        self.navigationController?.navigationItem.hidesBackButton = true
    }
    
    
    @IBAction func goToCart(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Bag", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CartVC") as! BagVC
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    func onStartViewController(){
//        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "OnboardingViewController") as! OnboardingViewController
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
}
