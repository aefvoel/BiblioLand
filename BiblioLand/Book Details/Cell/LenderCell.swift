//
//  LenderCell.swift
//  BiblioLand
//
//  Created by Salicca Dewi Rahajeng on 03/08/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class LenderCell: UITableViewCell {
    
    static let identifier = "LenderCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "LenderCell", bundle: nil)
    }

    @IBOutlet weak var lenderImg: UIImageView!
    @IBOutlet weak var lenderNameLbl: UILabel!
    @IBOutlet weak var lenderLocationLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
