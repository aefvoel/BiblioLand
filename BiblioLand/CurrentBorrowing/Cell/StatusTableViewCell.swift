//
//  StatusTableViewCell.swift
//  BiblioLand
//
//  Created by Calvin Leonardo on 10/08/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class StatusTableViewCell: UITableViewCell {

    @IBOutlet weak var circle: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        circle.layer.cornerRadius = 9
    }
}
