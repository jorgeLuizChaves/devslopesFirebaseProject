//
//  TimeLinePostsViewController.swift
//  devlsops-firebase
//
//  Created by Jorge Luiz on 7/28/16.
//  Copyright © 2016 Jorge Luiz. All rights reserved.
//

import UIKit
import Firebase

class TimeLinePostsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let dbPosts = FirebaseDataBaseService().posts()
        dbPosts.observeEventType(.Value, withBlock: { snapshot in
            if let posts = snapshot.value as? [String : [String : AnyObject]] {
                for (_, post) in posts {
                    NSLog("name: \(post["author"]!)")
                }
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
