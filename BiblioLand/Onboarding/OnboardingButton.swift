//
//  OnboardingButton.swift
//  BiblioLand
//
//  Created by Feidora Nadia Putri on 22/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class OnboardingButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton() {
        setShadow()
        setTitleColor(.white, for: .normal)
        backgroundColor = UIColor(red: 37.0/255.0, green: 126.0/255.0, blue: 121.0/255.0, alpha: 100.0/100.0)
        layer.cornerRadius = 7
    }
    
    func setShadow() {
        layer.shadowColor = UIColor(red: 37.0/255.0, green: 126.0/255.0, blue: 121.0/255.0, alpha: 20.0/100.0).cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        layer.shadowRadius = 10
    }
}
