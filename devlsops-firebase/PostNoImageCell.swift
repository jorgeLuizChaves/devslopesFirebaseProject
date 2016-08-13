//
//  PostNoImageCell.swift
//  devlsops-firebase
//
//  Created by jorge on 8/12/16.
//  Copyright © 2016 Jorge Luiz. All rights reserved.
//

import UIKit

class PostNoImageCell: UITableViewCell {

    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var excerpt: UILabel!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var heartImageView: UIImageView!
    
    
    func configurePostCell(post: Post) {
        if post.likes > 0 {
            likes.textColor = UIColor(hex: "#E2264D")
        }else{
            likes.textColor = UIColor(hex: "#4A4A4A")
            heartImageView.image = UIImage(named: "nolike")

        }
        likes.text = "\(post.likes)"
        title.text = post.title
        //        postImg.image = UIImage(data: NSData)
        excerpt.text = post.excerpt
        profileName.text = post.authorName
    }

}
