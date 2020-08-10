//
//  AllBookTableViewCell.swift
//  BiblioLand
//
//  Created by Calvin Leonardo on 21/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class AllBookTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    static let identifier = "AllBookTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "AllBookTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var didSelectItemAction: ((IndexPath) -> Void)?
    
    var books = [Books]()
    
    func configure(with books: [Books]){
        self.books = books
        collectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(AllBookCollectionViewCell.nib(), forCellWithReuseIdentifier: AllBookCollectionViewCell.identifier)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllBookCollectionViewCell.identifier, for: indexPath) as! AllBookCollectionViewCell
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowOffset = .zero
        cell.layer.shadowRadius = 5
        
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        
        cell.configure(with: books[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 118, height: 258)
    }
    
    
    @objc func tap(_ sender: UITapGestureRecognizer) {

           let location = sender.location(in: self.collectionView)
           let indexPath = self.collectionView.indexPathForItem(at: location)
            
    //        delegate?.viewAllGame(data: games)

           if let tempIndex = indexPath {
              print("Got clicked on index: \(books[tempIndex.row].bookId)!")
                didSelectItemAction?(tempIndex)
            UserDefaults.standard.set(books[tempIndex.row].bookId, forKey: "bookID")

           }
        }
}
