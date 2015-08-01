//
//  Event.swift
//  SlugRoute
//
//  Created by Brad Bernard on 5/25/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation
//import SwiftyJSON

class Event : NSObject
{
   var name                : String = ""
   var date                : String = ""
   var descriptionText     : String = ""
   
   init(data : JSON)
   {
      name              = data["name"].stringValue
      date              = data["date"].stringValue
      descriptionText   = data["description"].stringValue
   }
}