//
//  Extention Button.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 24/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func greenButton(){
        layer.cornerRadius = 7.0
        layer.masksToBounds = true
        
        layer.shadowColor = (UIColor(cgColor: #colorLiteral(red: 0.1568627451, green: 0.5137254902, blue: 0.4941176471, alpha: 1)) as! CGColor)
        layer.shadowOffset = CGSize(width: 0, height: 5.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 5.0
    }
    
    func redButton() {
        layer.cornerRadius = 7.0
        layer.masksToBounds = true
    }
}
