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
}

extension BagVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listBag.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as? ComponentListCell else {
            do {fatalError("Unable to create component list table")}
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    
}
