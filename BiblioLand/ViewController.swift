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
        onStartViewController()
    }
    
    func onStartViewController(){
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "OnboardingViewController") as! OnboardingViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
