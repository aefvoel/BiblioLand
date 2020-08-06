//
//  SignupVC.swift
//  BiblioLand
//
//  Created by Feidora Nadia Putri on 04/08/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var signupScrollView: UIScrollView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var addressTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUserData()
        
        // hide password
        passwordTextField.isSecureTextEntry = true
        showPasswordButton.addTarget(self, action: #selector(self.buttonPasswordVisibilityClicked(_:)), for: .touchUpInside)
        
        // to disable strong password autofill
        passwordTextField.textContentType = .oneTimeCode
    }
    
    @IBAction func buttonPasswordVisibilityClicked(_ sender: Any) {
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected {
            self.passwordTextField.isSecureTextEntry = false
            showPasswordButton.setImage(UIImage(named: "eye_slash"), for: .normal)
        } else {
            self.passwordTextField.isSecureTextEntry = true
            showPasswordButton.setImage(UIImage(named: "eye"), for: .normal)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        phoneNumberTextField.resignFirstResponder()
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func setupUserData() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
        passwordTextField.delegate = self
        addressTextView.delegate = self
    }
}
