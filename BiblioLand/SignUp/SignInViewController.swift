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
    let privateDatabase = CKContainer(identifier: "iCloud.id.appleacademy.Biblio").privateCloudDatabase
    var isUserExist = false

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
    override func viewDidAppear(_ animated: Bool) {
        if (UserDefaults.standard.bool(forKey: "isLoggedIn")){
            toHome()
        }
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
        retrieveUserFromCloudKit()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func toHome(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! UITabBarController
        //        self.navigationController?.pushViewController(vc, animated: true)
        
        let window = self.view.window
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
    
    func toSignUp(){
        let storyboard = UIStoryboard(name: "Signup", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(vc, animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func retrieveUserFromCloudKit(){
        let predicate = NSPredicate(value: true)
        
        let query = CKQuery(recordType: "userInfo", predicate: predicate)
        //        query.sortDescriptors = [NSSortDescriptor(key: "modificationDate", ascending: false)]
        
        let operation = CKQueryOperation(query: query)
        
        operation.recordFetchedBlock = { record in
            
            if (record["emailAddress"] == self.emailSignInTF.text && record["password"] == self.passwordSignInTF.text){
                UserDefaults.standard.set(record.recordID.recordName, forKey: "userID")
                self.isUserExist = true
                print("exist")
            }
        }
        
        operation.queryCompletionBlock = { cursor, error in
            
            DispatchQueue.main.async {
                
                if error == nil {
                    if (self.isUserExist) {
                        self.toHome()
                        UserDefaults.standard.set(true, forKey: "isLoggedIn")
                    } else {
                        print("user not exist")
                        UserDefaults.standard.set(false, forKey: "isLoggedIn")
                    }
                } else {
                    print(error!.localizedDescription)
                }
                
            }
            
        }
        
        privateDatabase.add(operation)
        
        
    }
}

extension SignInViewController: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as?  ASAuthorizationAppleIDCredential {
            let userID = appleIDCredential.user
            if let name = appleIDCredential.fullName?.givenName,
                let emailAddr = appleIDCredential.email {
                
                privateDatabase.fetch(withRecordID: CKRecord.ID(recordName: userID)) { (record, error) in
                    if error == nil {
                        UserDefaults.standard.set(true, forKey: "isLoggedIn")
                        UserDefaults.standard.set(userID, forKey: "userID")
                    } else {
                        UserDefaults.standard.set(userID, forKey: "userID")
                        UserDefaults.standard.set(name, forKey: "userName")
                        UserDefaults.standard.set(emailAddr, forKey: "userEmail")
                        UserDefaults.standard.set(false, forKey: "isLoggedIn")
                        print(error?.localizedDescription)
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
                        
                    }
                }
            }
        }
        if UserDefaults.standard.bool(forKey: "isLoggedIn"){
            toHome()
        }else {
            toSignUp()
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }
    
}
