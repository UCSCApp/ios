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

    var collegeNames                 : Array<String> = []

    init(data : Array<String>)
    {
        for college in data {
            collegeNames.append(college);
        }
        
    }
}