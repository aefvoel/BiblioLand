//
//  SignInViewController.swift
//  BiblioLand
//
//  Created by Feidora Nadia Putri on 05/08/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit
import AuthenticationServices
import CloudKit

class SignInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailSignInTF: UITextField!
    @IBOutlet weak var passwordSignInTF: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var showPassSignInButton: UIButton!
    
    @IBOutlet weak var signInBtnView: SignupButton!
    var authorizationButton: ASAuthorizationAppleIDButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailSignInTF.delegate = self
        passwordSignInTF.delegate = self
       
        // hide password
        passwordSignInTF.isSecureTextEntry = true
        showPassSignInButton.addTarget(self, action: #selector(self.buttonPasswordVisibilityClicked(_:)), for: .touchUpInside)
        
        // to disable strong password autofill
        passwordSignInTF.textContentType = .oneTimeCode
        
        authorizationButton = ASAuthorizationAppleIDButton(type: .default, style: .whiteOutline)
        authorizationButton.frame = CGRect(origin: .zero, size: signInBtnView.frame.size)
        authorizationButton.addTarget(self, action: #selector(handleAppleIdRequest), for: .touchUpInside)
        signInBtnView.addSubview(authorizationButton)
    }
    
    @objc func handleAppleIdRequest(){
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let authorizationController =     ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
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
    
    @IBAction func onBtnSIgnIn(_ sender: Any) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! UITabBarController
    //        self.navigationController?.pushViewController(vc, animated: true)
            
            let window = self.view.window
            window?.rootViewController = vc
            window?.makeKeyAndVisible()
        }
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(true)
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }

}

extension SignInViewController: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        let privateDatabase = CKContainer(identifier: "iCloud.id.appleacademy.Biblio").privateCloudDatabase
        if let appleIDCredential = authorization.credential as?  ASAuthorizationAppleIDCredential {
            let userID = appleIDCredential.user
            if let name = appleIDCredential.fullName?.givenName,
                let emailAddr = appleIDCredential.email {
                //New user (Signing up).
                //Save this information to CloudKit
                let record = CKRecord(recordType: "userInfo", recordID: CKRecord.ID(recordName: userID))
                record["name"] = name
                record["emailAddress"] = emailAddr
                privateDatabase.save(record) { (_, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    }else{
                        UserDefaults.standard.set(record.recordID.recordName, forKey: "userProfileID")
                    }
                    
                    
                }
            } else {
                //Returning user (signing in)
                //Fetch the user name/ email address
                //from private CloudKit
                privateDatabase.fetch(withRecordID: CKRecord.ID(recordName: userID)) { (record, error) in
                    if let fetchedInfo = record {
                        let name = fetchedInfo["name"] as? String
                        let userEmailAddr = fetchedInfo["emailAddress"] as? String
                        
                        //You can now use the user name and email address (like save it to local)
                        print("Name is \(name) and email address is \(userEmailAddr)")
                        UserDefaults.standard.set(userID, forKey: "userProfileID")
                    }
                }
            }
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! UITabBarController
        //        self.navigationController?.pushViewController(vc, animated: true)
                
                let window = self.view.window
                window?.rootViewController = vc
                window?.makeKeyAndVisible()
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }
    
}
