//
//  WishlistCell.swift
//  BiblioLand
//
//  Created by Salicca Dewi Rahajeng on 10/08/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class WishlistCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    static let identifier = "WishlistCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "WishlistCell", bundle: nil)
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var bookWishlist = [BookWishlist]()
    
    func configure(with bookWishlist: [BookWishlist]){
        self.bookWishlist = bookWishlist
        collectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.register(WishlistCollectionCell.nib(), forCellWithReuseIdentifier: WishlistCollectionCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        print("Data: \(bookWishlist)")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookWishlist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WishlistCollectionCell.identifier, for: indexPath) as! WishlistCollectionCell
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowOffset = .zero
        cell.layer.shadowRadius = 5
        
        cell.configure(with: bookWishlist[indexPath.row])
        
        return cell
    }
    
    
}
