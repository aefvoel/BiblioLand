//
//  ButtonCell.swift
//  BiblioLand
//
//  Created by Salicca Dewi Rahajeng on 04/08/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class ButtonCell: UITableViewCell {

    static let identifier = "ButtonCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "ButtonCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
