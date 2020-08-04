//
//  BorrowBooksCell.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 24/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class BorrowBooksCell: UITableViewCell {

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var booksCreator: UILabel!
    @IBOutlet weak var booksBorrowers: UILabel!
    @IBOutlet weak var bookPrice: UILabel!
    @IBOutlet weak var bookDeposit: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bookImage.layer.cornerRadius = 7.0
        bookImage.clipsToBounds = true
        
        shadowDecorate()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
