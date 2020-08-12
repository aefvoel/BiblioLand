//
//  WishlistCollectionCell.swift
//  BiblioLand
//
//  Created by Salicca Dewi Rahajeng on 06/08/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class WishlistCollectionCell: UICollectionViewCell {

    @IBOutlet weak var bookImg: UIImageView!
    @IBOutlet weak var bookTitleLbl: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    static let identifier = "WishlistCollectionCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "WishlistCollectionCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        bgView.layer.cornerRadius = 7.0
    }
    
    public func configure(with bookWishlist: BookWishlist){
        self.bookTitleLbl.text = bookWishlist.bookTitle
        self.bookImg.image = bookWishlist.bookImg
    }
}
