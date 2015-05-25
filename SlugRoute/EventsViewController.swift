//
//  EventsViewController.swift
//  SlugRoute
//
//  Created by Brad Bernard on 5/25/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class EventsViewController: UIViewController {
   
   var events : [Event] = []

   @IBOutlet weak var eventsTable: UITableView!
   
    override func viewDidLoad()
    {
      super.viewDidLoad()
      self.title  = "Events"
      
      getEvents()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
   func getEvents()
   {
      Alamofire.request(.GET, "http://ec2-52-8-25-141.us-west-1.compute.amazonaws.com/events/get/v1")
         .responseJSON { (req, res, json, error) in
            if(error != nil)
            {
               NSLog("Error: \(error)")
               println(req)
               println(res)
            }
            else
            {
               var json = JSON(json!)
               self.parseEvents(json)
            }
      }
   }
   
   func parseEvents(data : JSON)
   {
      for(key : String, json : JSON) in data
      {
         events.append(Event(data: json))
      }
      
      eventsTable.reloadData()
   }
   
   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
   {
      return events.count
   }
   
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let event = events[indexPath.row] as Event
      let cell = tableView.dequeueReusableCellWithIdentifier("EventTableCell", forIndexPath: indexPath) as! EventTableCell
      
      cell.nameLabel.text           = event.name
      cell.dateLabel.text           = event.date
      cell.descriptionLabel.text     = event.descriptionText
      
      return cell
   }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
