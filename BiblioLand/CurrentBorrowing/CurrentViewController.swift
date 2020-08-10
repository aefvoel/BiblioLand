//
//  CurrentBorrowingViewController.swift
//  BiblioLand
//
//  Created by Toriq Wahid Syaefullah on 29/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class CurrentViewController: UIViewController {
    @IBOutlet weak var listCurrentBook: UITableView!
    var dataCheckout = [BookForCheckout]()

    func setUpView() {
        listCurrentBook.separatorStyle = .none
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        navigationItem.title = "Current Borrowing"
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1450980392, green: 0.4941176471, blue: 0.4745098039, alpha: 1)
        self.navigationController?.navigationItem.backBarButtonItem?.title = ""
        self.navigationController?.navigationBar.barTintColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        
        dataCheckout = insertData()
        
        listCurrentBook.delegate = self
        listCurrentBook.dataSource = self
        
//        tableView.register(UINib(nibName: "BookBorrowing", bundle: nil), forCellReuseIdentifier: "BookBorrowing")

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
extension CurrentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataCheckout[section].booksData?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataCheckout.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
            guard let cell2 = listCurrentBook.dequeueReusableCell(withIdentifier: "BookBorrowing", for: indexPath) as? BookBorrowing else {
                do {fatalError("Unable to create component")}
            }
            
            let radius: CGFloat = 7.0
        
            cell2.containerView.layer.shadowColor = UIColor.black.cgColor
            cell2.containerView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            cell2.containerView.layer.shadowRadius = 4.0
            cell2.containerView.layer.shadowOpacity = 0.2
            cell2.containerView.layer.masksToBounds = false
            cell2.containerView.layer.cornerRadius = radius
            
            cell2.containerView.layer.cornerRadius = 7.0
            cell2.containerView.layer.masksToBounds = false
            
            cell2.bookImage.image = dataCheckout[indexPath.section].booksData?[indexPath.row].bookImage
            cell2.booksTitle.text = dataCheckout[indexPath.section].booksData?[indexPath.row].bookTitle
            cell2.borrowerNAme.text = dataCheckout[indexPath.section].borrowers?.boorowersName
            
            return cell2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

