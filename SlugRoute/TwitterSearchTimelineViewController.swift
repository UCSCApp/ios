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
        
        Twitter.sharedInstance().logInGuestWithCompletion { session, error in
            if let validSession = session {
                let client = Twitter.sharedInstance().APIClient
                self.dataSource = TWTRSearchTimelineDataSource(searchQuery: "#UCSC", APIClient: client)
            } else {
                println("error: \(error.localizedDescription)")
            }
        }
        /*
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "goBack")
        navigationItem.leftBarButtonItem = backButton
        */
    }
    /*
    func goBack(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    */
}