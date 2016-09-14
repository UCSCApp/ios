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
    var descriptionInfo   : String = ""
    var id            : Int = 0

    init(data : AnyObject)
    {
        id          = (data["id"] as? Int)!
        name        = (data["name"] as? String)!
        latitude    = (data["latitude"] as? String)!
        longitude   = (data["longitude"] as? String)!
        type        = (data["type"] as? String)!
        descriptionInfo = (data["description"] as? String)!
        
    }
}