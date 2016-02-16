//
//  Event.swift
//  SlugRoute
//
//  Created by Brad Bernard on 5/25/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation

class Event : NSObject
{
   var name                : String = ""
   var date                : String = ""
   var descriptionText     : String = ""
   var url                 : String = ""
   
   init(data : AnyObject)
   {
      name              = (data["name"] as? String)!
      date              = (data["date"] as? String)!
      descriptionText   = (data["description"] as? String)!
      url               = (data["url"] as? String)!

   }
}