//
//  LoopBus.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 2/19/16.
//  Copyright © 2016 UCSC iOS. All rights reserved.
//

import Foundation

class LoopBus : NSObject
{
    var id                : String = ""
    var lon               : Double = 0
    var lat               : Double = 0
    var type              : String = ""
    
    init(data : AnyObject)
    {
        id                 = (data["id"] as? String)!
        lon                = (data["lon"] as? Double)!
        lat                = (data["lat"] as? Double)!
        type               = (data["type"] as? String)!
        
    }
}