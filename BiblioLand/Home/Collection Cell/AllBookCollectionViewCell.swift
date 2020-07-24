//
//  AllBookCollectionViewCell.swift
//  BiblioLand
//
//  Created by Calvin Leonardo on 21/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class AllBookCollectionViewCell: UICollectionViewCell {

        @IBOutlet weak var bookImgView: UIImageView!
        @IBOutlet weak var bookTitleLbl: UILabel!
        @IBOutlet weak var bgView: UIView!
        @IBOutlet weak var bookPriceLbl: UILabel!
    
        static let identifier = "AllBookCollectionViewCell"
        static func nib() -> UINib{
            return UINib(nibName: "AllBookCollectionViewCell", bundle: nil)
        }
       
        override func awakeFromNib() {
            super.awakeFromNib()
           
            bgView.layer.cornerRadius = 7.0
        }

        public func configure(with book: Books){
           self.bookTitleLbl.text = book.bookTitle
           self.bookPriceLbl.text = book.bookPrice
           self.bookImgView.image = book.bookImg
        }
}
