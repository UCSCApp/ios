//
//  EventViewController.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 8/31/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation
import UIKit

class EventViewController: UIViewController {
    
    var nameLabel:String!
    var dateLabel:String!
    var descriptionLabel:String!
    var image:UIImage!
    
    @IBOutlet weak var imageBanner: UIImageView!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title  = "Event"
        eventName.text = nameLabel
        eventDate.text = dateLabel
        eventDescription.text = descriptionLabel
        imageBanner.image = image
        
        //for swipe right to go back to SocialViewController
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //function for swipe gestures
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            //swipe right
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                print("Swiped right")
                let storyboard : UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
                let vc : EventsViewController = storyboard.instantiateViewControllerWithIdentifier("eventsView") as! EventsViewController
                
                self.presentViewController(vc, animated: true, completion: nil)
            default:
                break
            }
        }
    }
    

    
}
