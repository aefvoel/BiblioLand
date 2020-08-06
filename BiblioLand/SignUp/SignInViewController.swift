//
//  SignInViewController.swift
//  BiblioLand
//
//  Created by Feidora Nadia Putri on 05/08/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailSignInTF: UITextField!
    @IBOutlet weak var passwordSignInTF: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var showPassSignInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailSignInTF.delegate = self
        passwordSignInTF.delegate = self
       
        // hide password
        passwordSignInTF.isSecureTextEntry = true
        showPassSignInButton.addTarget(self, action: #selector(self.buttonPasswordVisibilityClicked(_:)), for: .touchUpInside)
        
        // to disable strong password autofill
        passwordSignInTF.textContentType = .oneTimeCode
    }
    
    @IBAction func buttonPasswordVisibilityClicked(_ sender: Any) {
    (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
    if (sender as! UIButton).isSelected {
        self.passwordSignInTF.isSecureTextEntry = false
        showPassSignInButton.setImage(UIImage(named: "eye_slash"), for: .normal)
    } else {
        self.passwordSignInTF.isSecureTextEntry = true
        showPassSignInButton.setImage(UIImage(named: "eye"), for: .normal)
        }
    }
        
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
