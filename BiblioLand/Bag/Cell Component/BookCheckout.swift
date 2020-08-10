//
//  BookCheckout.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 24/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

protocol CellDelegate: AnyObject {
    func DeleteBooks(_ bookCheckout: BookCheckout, booksYouWantDelete section: Int, row: Int)
}

class BookCheckout: UITableViewCell {
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var booksTitle: UILabel!
    @IBOutlet weak var pricing: UILabel!
    @IBOutlet weak var deposit: UILabel!
    @IBOutlet weak var bookImage: UIImageView! {
        didSet {
            bookImage.layer.cornerRadius = 7.0
            bookImage.clipsToBounds = true
        }
    }
    
    var rows: Int = 0
    var section: Int = 0
    
    weak var delegate: CellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        TableShadowDecorate()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func DeleteBooks(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.tintColor = .clear

        if sender.isSelected {
            sender.tintColor = UIColor.red
        } else {
            sender.tintColor = UIColor.black
        }
        
        self.delegate?.DeleteBooks(self, booksYouWantDelete: section, row: rows)
    }
}
