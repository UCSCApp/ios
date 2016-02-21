//
//  TabBarController.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 8/1/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        self.delegate = self
        let tabItems = self.tabBar.items as! [UITabBarItem]!
        let tabItem0 = tabItems[0] as UITabBarItem
        let tabItem1 = tabItems[1] as UITabBarItem
        let tabItem2 = tabItems[2] as UITabBarItem
        //let tabItem3 = tabItems[3] as UITabBarItem
        //let tabItem4 = tabItems[4] as UITabBarItem
        tabItem0.title = "Events"
        //tabItem1.title = "Social"
        tabItem1.title = "Map"
        //tabItem3.title = "Settings"
        tabItem2.title = "Dining"
    }

    // UITabBarDelegate
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        var myCustomViewController: MapViewController = MapViewController(nibName: nil, bundle: nil)
        myCustomViewController.invalidateTimer = true
        print("Selected item")
    }
    
    // UITabBarControllerDelegate
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        var myCustomViewController: MapViewController = MapViewController(nibName: nil, bundle: nil)
        myCustomViewController.invalidateTimer = true
        print("Selected view controller")
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}