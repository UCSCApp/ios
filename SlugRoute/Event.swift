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
   var id                  : Int    = 0
   
   init(data : AnyObject)
   {
      id                = (data["id"] as? Int)!
      name              = (data["name"] as? String)!
      date              = (data["date"] as? String)!
      descriptionText   = (data["description"] as? String)!
      url               = (data["image"] as? String)!

   }
}