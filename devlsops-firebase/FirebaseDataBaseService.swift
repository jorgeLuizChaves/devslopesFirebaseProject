//
//  FirebaseDataBaseService.swift
//  devlsops-firebase
//
//  Created by Jorge Luiz on 7/28/16.
//  Copyright © 2016 Jorge Luiz. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct FirebaseDataBaseService {
    
    let POSTS = "/posts"
    let USERS = "/users"
 
    func posts() -> FIRDatabaseReference {
        return FIRDatabase.database().referenceWithPath(POSTS)
    }
    
    func addUser(user: FIRUser) {
        let userReference = FIRDatabase.database().referenceWithPath(USERS)
        userReference.child(user.uid).setValue(["provider": user.providerID])
    }
}