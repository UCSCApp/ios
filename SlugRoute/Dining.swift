//
//  Dining.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 9/10/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation

class Dining : NSObject
{
    var name                : String = ""
    var items               : Dictionary<String,AnyObject>
    
    init(data : AnyObject)
    {
        name              = (data["name"] as? String)!
        items             = (data["items"] as? Dictionary<String,AnyObject>)!
        
    }
}