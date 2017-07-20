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
    var name: String = ""
    var items: AnyObject = "" as AnyObject
    
    init(data : [String: Any])
    {
        name = data["name"] as! String
        items = data["items"] as AnyObject
        
    }
}
