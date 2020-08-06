//
//  TotalPay.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 24/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class TotalPay: UITableViewCell {

    @IBOutlet weak var totalPay: UILabel!
            
    override func awakeFromNib() {
        super.awakeFromNib()
        
        TableShadowDecorate()
    }
    
    func updateTotalPay(data: String) {
        totalPay.text = data
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
