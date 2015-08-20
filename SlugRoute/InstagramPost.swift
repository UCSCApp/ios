//
//  InstagramPost.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 8/18/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation

class InstagramPost : NSObject
{
    var user                : String = ""
    var picture             : String = ""
    var picdescription      : String = ""
    
    init(url : String,username : String,text : String)
    {
        user              = username
        picture           = url
        picdescription    = text
    }
}