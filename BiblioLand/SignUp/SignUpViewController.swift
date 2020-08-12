//
//  SignupVC.swift
//  BiblioLand
//
//  Created by Feidora Nadia Putri on 04/08/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit
import CloudKit
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
        
        initializeHideKeyboard()
    }
    
    func toHome(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! UITabBarController
        //        self.navigationController?.pushViewController(vc, animated: true)
                
                let window = self.view.window
                window?.rootViewController = vc
                window?.makeKeyAndVisible()
    }
    
    func saveData() {

        let privateDatabase = CKContainer(identifier: "iCloud.id.appleacademy.Biblio").publicCloudDatabase

        let record = CKRecord(recordType: "userInfo", recordID: CKRecord.ID(recordName: UserDefaults.standard.string(forKey: "userID")!))

//        let record = CKRecord(recordType: "userInfo")
        record["name"] = nameTextField.text
        record["emailAddress"] = emailTextField.text
        record["phone"] = phoneNumberTextField.text
        record["password"] = passwordTextField.text
        record["address"] = addressTextView.text
        record["balance"] = 0
        record["deposit"] = 0
        record["notes"] = "available"
        record["latitude"] = "0"
        record["longitude"] = "0"
        privateDatabase.save(record) { (_, error) in
            if let error = error {
                UserDefaults.standard.set(false, forKey: "isLoggedIn")
                print(error.localizedDescription)
            }else{
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
            }
            
        }
        
        if UserDefaults.standard.bool(forKey: "isLoggedIn"){
            toHome()
        }else {
            print("something wrong")
        }
    }
    @IBAction func onBtnSignUp(_ sender: Any) {
        saveData()
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
        
        nameTextField.text = UserDefaults.standard.string(forKey: "userName")
        emailTextField.text = UserDefaults.standard.string(forKey: "userEmail")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func initializeHideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
}
