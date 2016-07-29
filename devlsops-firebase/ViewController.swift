//
//  ViewController.swift
//  devlsops-firebase
//
//  Created by Jorge Luiz on 7/16/16.
//  Copyright © 2016 Jorge Luiz. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import Spring

class ViewController: UIViewController, FBSDKLoginButtonDelegate, UITextFieldDelegate {

    @IBOutlet weak var emailText: DesignableTextField!
    @IBOutlet weak var passwordText: DesignableTextField!
    @IBOutlet weak var facebookLoginButton: FBSDKLoginButton!
    
    @IBOutlet weak var viewTest: UIView!
    
    let USER_NOT_FOUND_CODE = 17011
    
    override func viewDidLoad() {
        super.viewDidLoad()
        facebookLoginButton.delegate = self
        facebookLoginButton.readPermissions = ["public_profile", "email", "user_friends"]
        facebookLoginButton.tooltipColorStyle = FBSDKTooltipColorStyle.NeutralGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        self.view.becomeFirstResponder()
    }
    
    @IBAction func facebookButtonDidTouch(sender: AnyObject!) {
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logInWithReadPermissions(["email"], fromViewController: self) { (facebookLoginResult, facebookError) in
            if(facebookError != nil){
                NSLog("Facebook login failed. Error \(facebookError)")
            }else if (facebookLoginResult.isCancelled){
                NSLog("Facebook login was cancelled.")
            }else{
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                NSLog("sucesso champs ;)")
                let credential = FIRFacebookAuthProvider.credentialWithAccessToken(accessToken)
                
                FIRAuth.auth()?.signInWithCredential(credential, completion: { (user, error) in
                     NSLog("aqui foi com face")
                    self.segueToDashboard()
                })
               
            }
        }
    }
    
    @IBAction func loginButtonDidTouch(sender: AnyObject) {
        if let email = emailText.text where emailText.text != "", let password = passwordText.text where passwordText.text != "" {
            FIRAuth.auth()?.signInWithEmail(email, password: password, completion: { (user, error) in
                
                if(error != nil){
                    if(error?.code == self.USER_NOT_FOUND_CODE){
                        FIRAuth.auth()?.createUserWithEmail(email, password: password, completion: { (user, error) in
                            NSLog("login criado com sucesso. ;)")
                            self.segueToDashboard()
                        })
                    }
                }else{
                    NSLog("user already registered")
                    self.segueToDashboard()
                }
            })
        }
    }
    
    //MARK: Delegate FBSDKLoginButton
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if(error != nil){
            NSLog("Facebook login failed. Error \(error)")
        }else if (result.isCancelled){
            NSLog("Facebook login was cancelled.")
        }else{
            let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
            NSLog("sucesso champs ;)")
            let credential = FIRFacebookAuthProvider.credentialWithAccessToken(accessToken)
            
            FIRAuth.auth()?.signInWithCredential(credential, completion: { (user, error) in
                NSLog("aqui foi com face")
                self.segueToDashboard()
            })
        }
    }
    
    func loginButtonWillLogin(loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    //MARK: Private Functions
    private func segueToDashboard() {
        performSegueWithIdentifier("segueHome", sender: nil)
    }
}