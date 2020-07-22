//
//  AllGenreCollectionViewCell.swift
//  BiblioLand
//
//  Created by Calvin Leonardo on 21/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class AllGenreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var genreTitleLbl: UILabel!
    
    static let identifier = "AllGenreCollectionViewCell"
     static func nib() -> UINib{
         return UINib(nibName: "AllGenreCollectionViewCell", bundle: nil)
     }
     
     override func awakeFromNib() {
         super.awakeFromNib()
         // Initialization code
         
         bgView.layer.cornerRadius = 7.0
     }

     public func configure(with genre: Genre){
        self.genreTitleLbl.text = genre.genreName
     }

}
