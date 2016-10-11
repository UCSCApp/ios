//
//  SocialViewController.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 8/1/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation
import UIKit
import TwitterKit

class SocialViewController: UIViewController {
    
/*
    @IBAction func ToInstagramLogin(sender: UIButton) {
    }
*/
    @IBAction func ToTwitterLogin(sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Social";
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
