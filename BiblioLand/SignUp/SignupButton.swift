//
//  SignupButton.swift
//  BiblioLand
//
//  Created by Feidora Nadia Putri on 04/08/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class SignupButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSignupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSignupButton()
    }
    
    func setupSignupButton() {
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 7
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.2
    }
}
