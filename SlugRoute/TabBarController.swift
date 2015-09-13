//
//  TabBarController.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 8/1/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad();
        let tabItems = self.tabBar.items as! [UITabBarItem]
        let tabItem0 = tabItems[0] as UITabBarItem
        let tabItem1 = tabItems[1] as UITabBarItem
        let tabItem2 = tabItems[2] as UITabBarItem
        let tabItem3 = tabItems[3] as UITabBarItem
        let tabItem4 = tabItems[4] as UITabBarItem
        tabItem0.title = "Events"
        tabItem1.title = "Social"
        tabItem2.title = "Map"
        tabItem3.title = "Settings"
        tabItem4.title = "Dining"
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}