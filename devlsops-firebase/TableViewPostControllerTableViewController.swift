//
//  TableViewPostControllerTableViewController.swift
//  devlsops-firebase
//
//  Created by jorge on 8/8/16.
//  Copyright © 2016 Jorge Luiz. All rights reserved.
//

import UIKit

class TableViewPostControllerTableViewController: UITableViewController {
    
    
    private var postsList: [Post] = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 182
        tableView.rowHeight = UITableViewAutomaticDimension
        
        let dbPosts = FirebaseDataBaseService().posts()
        dbPosts.observeEventType(.Value, withBlock: { snapshot in
            if let posts = snapshot.value as? [String : [String : AnyObject]] {
                for (_, post) in posts {
                    let postLine = self.configurePost(post)
                    self.postsList.append(postLine)
                }
                
            }
        })

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.postsList.count
    }
    
    private func configureCellWithImage(post: Post, identifierCell: String) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier(identifierCell)! as? PostCell {
            cell.configurePostCell(post)
            return cell
        } else {
            let cell = PostCell()
            cell.configurePostCell(post)
            return cell
        }
    }
    
    private func configureCellNoImage(post: Post, identifierCell: String) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier(identifierCell)! as? PostNoImageCell {
            cell.configurePostCell(post)
            return cell
        } else {
            let cell = PostNoImageCell()
            cell.configurePostCell(post)
            return cell
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = postsList[indexPath.row]
        
        if let _ = post.imgUrl {
            return self.configureCellWithImage(post, identifierCell: "reuseIdentifier")
        }else{
            return self.configureCellNoImage(post, identifierCell: "cellNoImage")
        }
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func configurePost(post: [String: AnyObject]) -> Post {
        let userKey = post["author"]! as! String
        let user = FirebaseDataBaseService().findUser(userKey)
        
        
        let postLine = Post()
        postLine.authorKey = post["author"]! as! String
        postLine.excerpt = post["excerpt"]! as! String
        postLine.likes = post["likes"]! as! Int
        postLine.title = post["title"]! as! String
        
        if let imgUrl = post["image"] as? String{
            postLine.imgUrl = imgUrl
        }
        
        user.observeEventType(.Value, withBlock:  {  userData in
            if let info = userData.value as? [String: AnyObject]{
                postLine.authorName = info["name"]! as! String
                postLine.authorUlrImg = info["profile_url_img"] as? String
                self.tableView.reloadData()
            }
            
        })
        return postLine
    }

}
