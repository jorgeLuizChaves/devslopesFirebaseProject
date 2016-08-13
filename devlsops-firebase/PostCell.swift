//
//  PostCell.swift
//  devlsops-firebase
//
//  Created by jorge on 8/11/16.
//  Copyright © 2016 Jorge Luiz. All rights reserved.
//

import Foundation
import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var excerpt: UILabel!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var heartImageView: UIImageView!
    
    
    func configurePostCell(post: Post) {
        likes.text = "\(post.likes)"
        title.text = post.title
//        postImg.image = UIImage(data: NSData)
        excerpt.text = post.excerpt
        heartImageView.image = UIImage(named: "nolike")
        profileName.text = post.authorName
        if let _ = post.imgUrl {
//            profileImg.image = UIImage()
        }
    }
}
