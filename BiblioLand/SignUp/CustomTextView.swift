//
//  CustomTextView.swift
//  BiblioLand
//
//  Created by Feidora Nadia Putri on 04/08/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

let borderColor = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 100.0/100.0)

class CustomTextView: UITextView {
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: CGRect.zero, textContainer: nil)
        setupTextView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTextView()
    }
    
    func setupTextView() {
        layer.cornerRadius = 5.0
        layer.borderWidth = 1.0
        layer.borderColor = borderColor.cgColor
    }
}
