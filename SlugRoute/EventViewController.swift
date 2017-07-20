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
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(EventViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //function for swipe gestures
    func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            //swipe right
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                println("Swiped right")
                let storyboard : UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
                let vc : EventsViewController = storyboard.instantiateViewController(withIdentifier: "eventsView") as! EventsViewController
                
                self.present(vc, animated: true, completion: nil)
            default:
                break
            }
        }
    }
    

    
}
