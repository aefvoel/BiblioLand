//
//  BookTableViewCell.swift
//  BiblioLand
//
//  Created by Calvin Leonardo on 21/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    static let identifier = "BookTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "BookTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var books = [Book]()
    
    func configure(with books: [Book]){
        self.books = books
        collectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(BookCollectionViewCell.nib(), forCellWithReuseIdentifier: BookCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
        
    }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCollectionViewCell.identifier, for: indexPath) as! BookCollectionViewCell
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowOffset = .zero
        cell.layer.shadowRadius = 6
        
        cell.configure(with: books[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 124, height: 258)
    }
}
