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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func facebookButtonDidTouch(sender: AnyObject!) {
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logInWithReadPermissions(["email"], fromViewController: self) { (facebookLoginResult, facebookError) in
            if(facebookError != nil){
                print("Facebook login failed. Error \(facebookError)")
            }else if (facebookLoginResult.isCancelled){
                print("Facebook login was cancelled.")
            }else{
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                print("sucesso champs ;)")
                print(accessToken)
            }
        }
    }
}