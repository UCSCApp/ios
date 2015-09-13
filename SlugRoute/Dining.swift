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
    var items               : AnyObject = ""
    
    init(data : JSON)
    {
        name              = data["name"].stringValue
        items             = data["items"].object
        
    }
}