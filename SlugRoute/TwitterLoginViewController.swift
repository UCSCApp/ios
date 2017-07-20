//
//  TwitterLoginViewController.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 7/31/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation
import UIKit
import TwitterKit

//http://docs.fabric.io/ios/twitter/show-timelines.html
class TwitterLoginViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let logInButton = TWTRLogInButton { (session, error) in
            // play with Twitter session
            let vc = TwitterSearchTimelineViewController()
            
            self.present(vc, animated: true, completion: nil)
        }
        logInButton?.center = self.view.center
        self.view.addSubview(logInButton!)
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

