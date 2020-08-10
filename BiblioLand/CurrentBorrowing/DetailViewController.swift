//
//  DetailViewController.swift
//  BiblioLand
//
//  Created by Toriq Wahid Syaefullah on 29/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var buttonCancel: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        buttonCancel.layer.cornerRadius = 7
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}


extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
           let cell = tableView.dequeueReusableCell(withIdentifier: "SecondCell", for: indexPath)

            return cell
        }
            
        else {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath) as! StatusTableViewCell
         
            return cell2
        }
            
    }
    
    
}
