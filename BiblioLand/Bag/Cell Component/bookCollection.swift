//
//  bookCollection.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 23/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class bookCollection: UICollectionViewCell {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var pricingBook: UILabel!
    @IBOutlet weak var checkoutButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        checkoutButton.layer.cornerRadius = 7.0
        checkoutButton.clipsToBounds = true
        
        bookImage.layer.cornerRadius = 7.0
        bookImage.clipsToBounds = true
        
        shadowDecorate()
    }

}
