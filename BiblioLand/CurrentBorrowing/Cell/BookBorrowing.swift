//
//  BookBorrowing.swift
//  BiblioLand
//
//  Created by Toriq Wahid Syaefullah on 29/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class BookBorrowing: UITableViewCell {

    @IBOutlet weak var booksTitle: UILabel!
    @IBOutlet weak var borrowerNAme: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var dueDate: UILabel!
    @IBOutlet weak var bookImage: UIImageView! {
        didSet {
            bookImage.layer.cornerRadius = 7.0
            bookImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var returnBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        returnBtn.layer.cornerRadius = 7
    }
}
