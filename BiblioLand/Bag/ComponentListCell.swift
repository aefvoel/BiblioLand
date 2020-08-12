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
    var booksData = [books]()
    
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
    }

}

extension ComponentListCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return booksData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCollection", for: indexPath) as! bookCollection
        
        let price = idrFormat(harga: booksData[indexPath.row].pricing!)
        cell.bookImage.image = booksData[indexPath.row].bookImage
        cell.bookTitle.text = booksData[indexPath.row].bookTitle
        cell.pricingBook.text = "Rp\(price)/day"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 124, height: 295)
    }
}
