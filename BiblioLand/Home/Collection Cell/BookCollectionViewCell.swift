//
//  BookCollectionViewCell.swift
//  BiblioLand
//
//  Created by Calvin Leonardo on 21/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bookImgView: UIImageView!
    @IBOutlet weak var bookTitleLbl: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var bookPriceLbl: UILabel!
    
    static let identifier = "BookCollectionViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "BookCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        bgView.layer.cornerRadius = 7.0
    }

    public func configure(with book: Book){
        self.bookTitleLbl.text = book.bookTitle
        self.bookPriceLbl.text = book.bookPrice
        self.bookImgView.image = book.bookImg
    }
}
