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
    func imageFromUrl(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
    func imageFromUrl(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        imageFromUrl(url: url, contentMode: mode)
    }
}

class InstagramLoginViewController: UIViewController {
    var posts : [InstagramPost] = []
    
    @IBOutlet weak var instagramTable: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        /*
        //for swipe right to go back to SocialViewController
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        */
        
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
        let CLIENT_ID : String = "2eb0b0a219ba482c9b9121c8287cc4aa"
        let getUCSC = "https://api.instagram.com/v1/tags/UCSC/media/recent?client_id="+CLIENT_ID
        var theUrl : String = ""
        var theUsername : String = ""
        var theText : String = ""
        
        let jsonData = try? Data(contentsOf: URL(string: getUCSC)!)
        let jsonOptional: AnyObject! = JSONSerialization.jsonObject(with: jsonData!, options:.allowFragments)
        
        //parse from JSON
        if let json = jsonOptional as? Dictionary<String, AnyObject> {
            if let other = json["data"] as? Array<AnyObject> {
                for(json : _) in other{
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row] as InstagramPost
        let cell = tableView.dequeueReusableCell(withIdentifier: "InstagramTableCell", for: indexPath) as! InstagramTableCell
        
        cell.userLabel.text           = post.user
        cell.pictureLabel.imageFromUrl(post.picture)
        cell.descriptionLabel.text    = post.picdescription
        return cell
    }
    
}
