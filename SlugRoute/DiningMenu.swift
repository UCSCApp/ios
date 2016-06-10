//
//  DiningMenu.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 6/8/16.
//  Copyright © 2016 UCSC iOS. All rights reserved.
//

import Foundation

class DiningMenu : NSObject
{
    var items                        : Dictionary<String,AnyObject> = [:]

    
    init(data : AnyObject)
    {
        self.items = data as! Dictionary<String,AnyObject>

        
    }
}