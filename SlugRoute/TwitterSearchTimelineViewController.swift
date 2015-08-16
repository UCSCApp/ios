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

class TwitterSearchTimelineViewController: TWTRTimelineViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        Twitter.sharedInstance().logInGuestWithCompletion { session, error in
            if let validSession = session {
                let client = Twitter.sharedInstance().APIClient
                self.dataSource = TWTRSearchTimelineDataSource(searchQuery: "#UCSC", APIClient: client)
            } else {
                println("error: \(error.localizedDescription)")
            }
        }

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