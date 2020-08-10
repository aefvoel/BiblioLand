//
//  ResultnyaTBC.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 07/08/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class ResultnyaTBC: UITableViewCell {

    @IBOutlet weak var bookImage: UIImageView! {
        didSet{
            roundedView()
        }
    }
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var borrowFrom: UILabel!
    @IBOutlet weak var bookPricing: UILabel!
    @IBOutlet weak var booksStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
