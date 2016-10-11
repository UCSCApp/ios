//
//  TabBarController.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 8/1/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: Int) {
        let r = hex / 0x10000
        let g = (hex - r*0x10000) / 0x100
        let b = hex - r*0x10000 - g*0x100
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
    }
}

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        self.delegate = self
        UINavigationBar.appearance().barTintColor = UIColor(hex: 0x00458C)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        UITabBar.appearance().barTintColor = UIColor(hex: 0x00458C)
        //UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.whiteColor()], forState: .Normal)
        //
        //UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(hex: 0x607D8B)], forState:.Selected)
        let tabItems = self.tabBar.items as [UITabBarItem]!
        let tabItem0 = tabItems[0] as UITabBarItem
        let tabItem1 = tabItems[1] as UITabBarItem
        let tabItem2 = tabItems[2] as UITabBarItem
        let tabItem3 = tabItems[3] as UITabBarItem
        tabItem0.title = "Map" //Map
        tabItem1.title = "Dining" //Dining
        tabItem2.title = "Social" //Social
        tabItem3.title = "Events" //Events
        tabItem0.image = UIImage(named: "ic_map")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        tabItem0.selectedImage = UIImage(named: "ic_map")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        tabItem1.image = UIImage(named: "ic_dining")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        tabItem1.selectedImage = UIImage(named: "ic_dining")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        tabItem2.image = UIImage(named: "ic_social")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        tabItem2.selectedImage = UIImage(named: "ic_social")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        tabItem3.image = UIImage(named: "ic_events")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        tabItem3.selectedImage = UIImage(named: "ic_events")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        tabItem0.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tabItem1.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tabItem2.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tabItem3.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    // UITabBarDelegate
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        let myCustomViewController: MapViewController = MapViewController(nibName: nil, bundle: nil)
        myCustomViewController.invalidateTimer = true

    }
    
    // UITabBarControllerDelegate
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        let myCustomViewController: MapViewController = MapViewController(nibName: nil, bundle: nil)
        myCustomViewController.invalidateTimer = true
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
