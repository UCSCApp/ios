//
//  InstagramLoginViewController.swift
//  SlugRoute
//
//  Created by Karol Josef Bustamante on 7/31/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation
import UIKit

//an extension for imageview in order to show to the picture in a cell
extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                self.image = UIImage(data: data)
            }
        }
    }
}

class InstagramLoginViewController: UIViewController {
    var posts : [InstagramPost] = []
    
    @IBOutlet weak var instagramTable: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //for swipe right to go back to SocialViewController
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        self.title  = "Instagram"
        
        parsePosts()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parsePosts()
    {
        var CLIENT_ID : String = "2eb0b0a219ba482c9b9121c8287cc4aa"
        var getUCSC = "https://api.instagram.com/v1/tags/UCSC/media/recent?client_id="+CLIENT_ID
        var theUrl : String = ""
        var theUsername : String = ""
        var theText : String = ""
        
        let jsonData = NSData(contentsOfURL: NSURL(string: getUCSC)!)
        var jsonErrorOptional: NSError?
        let jsonOptional: AnyObject! = NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions(0), error: &jsonErrorOptional)
        
        //parse from JSON
        if let json = jsonOptional as? Dictionary<String, AnyObject> {
            if let other = json["data"] as? Array<AnyObject> {
                for(json : AnyObject) in other{
                    if let user = json["user"] as?  Dictionary<String,AnyObject>  {
                        if let userName = user["full_name"] as AnyObject? as? String {
                            theUsername = userName
                        }
                    }
                    if let images = json["images"] as?  Dictionary<String,AnyObject>  {
                        if let low = images["low_resolution"] as?  Dictionary<String,AnyObject>  {
                            if let image = low["url"] as AnyObject? as? String {
                                theUrl = image
                            }
                        }
                    }
                    if let caption = json["caption"] as?  Dictionary<String,AnyObject>  {
                        if let cap = caption["text"] as AnyObject? as? String {
                            theText = cap
                        }
                    }
                    posts.append(InstagramPost(url: theUrl,username: theUsername,text: theText))
                }
                
            }
        }
                    
        
        instagramTable.reloadData()

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return posts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let post = posts[indexPath.row] as InstagramPost
        var cell = tableView.dequeueReusableCellWithIdentifier("InstagramTableCell", forIndexPath: indexPath) as! InstagramTableCell
        
        cell.userLabel.text           = post.user
        cell.pictureLabel.imageFromUrl(post.picture)
        cell.descriptionLabel.text    = post.picdescription
        return cell
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                println("Swiped right")
                let storyboard : UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
                let vc : SocialViewController = storyboard.instantiateViewControllerWithIdentifier("socialView") as! SocialViewController
                
                self.presentViewController(vc, animated: true, completion: nil)
            default:
                break
            }
        }
    }
    
}
