//
//  TwitterSearchTimelineViewController.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 8/13/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation
import UIKit
import TwitterKit

//http://docs.fabric.io/ios/twitter/show-timelines.html
class TwitterSearchTimelineViewController: TWTRTimelineViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Twitter"
        
        /*
        //for swipe right to go back to SocialViewController
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        */
        
        Twitter.sharedInstance().logInGuestWithCompletion { session, error in
            if ((session) != nil) {
                let client = Twitter.sharedInstance().APIClient
                self.dataSource = TWTRSearchTimelineDataSource(searchQuery: "#UCSC", APIClient: client)
            } else {
                print("error: \(error.localizedDescription)")
            }
        }

    }
    
    /*
    //function for swipe gestures
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            //swipe right
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
    */
    

}