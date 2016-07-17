//
//  Facility.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 7/16/16.
//  Copyright © 2016 UCSC iOS. All rights reserved.
//

import Foundation

class Facility : NSObject
{
    var name          : String = ""
    var latitude      : String = ""
    var longitude     : String = ""
    var type          : String = ""
    
    init(data : AnyObject)
    {
        name        = (data["name"] as? String)!
        latitude    = (data["latitude"] as? String)!
        longitude   = (data["longitude"] as? String)!
        type        = (data["type"] as? String)!
        
    }
}