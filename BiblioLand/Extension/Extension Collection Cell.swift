//
//  Extension Collection Cell.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 27/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionViewCell {
func shadowDecorate() {
    let radius: CGFloat = 7.0
    contentView.layer.cornerRadius = radius
    contentView.layer.masksToBounds = true

    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = CGSize(width: 0, height: 1.0)
    layer.shadowRadius = 4.0
    layer.shadowOpacity = 0.2
    layer.masksToBounds = false
    layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
    layer.cornerRadius = radius
    }
}

extension UITableViewCell {
    func shadowDecorate() {
        let radius: CGFloat = 7.0
        contentView.layer.cornerRadius = radius
        contentView.layer.masksToBounds = true

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 10.0)
        layer.shadowRadius = 10.0
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
        layer.cornerRadius = radius
    }
}
