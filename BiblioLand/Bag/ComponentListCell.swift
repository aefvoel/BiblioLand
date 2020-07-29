//
//  ComponentListCell.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 27/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class ComponentListCell: UITableViewCell {

    @IBOutlet weak var bookRecommendation: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bookRecommendation.dataSource = self
        bookRecommendation.delegate = self
        
        let nibCell = UINib(nibName: "bookCollection", bundle: nil)
        bookRecommendation.register(nibCell, forCellWithReuseIdentifier: "bookCollection")
        
        bookRecommendation.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ComponentListCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCollection", for: indexPath) as! bookCollection
        
        cell.bookImage.image = UIImage(named: "Book2")
        cell.bookTitle.text = "How To Trains You"
        cell.pricingBook.text = "Rp10.000"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 124, height: 295)
    }
}
