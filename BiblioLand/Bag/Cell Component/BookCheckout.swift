//
//  BookCheckout.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 24/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class BookCheckout: UITableViewCell {

    @IBOutlet weak var booksTitle: UILabel!
    @IBOutlet weak var pricing: UILabel!
    @IBOutlet weak var deposit: UILabel!
    @IBOutlet weak var borrowerNAme: UILabel!
    @IBOutlet weak var bookImage: UIImageView! {
        didSet {
            bookImage.layer.cornerRadius = 7.0
            bookImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
