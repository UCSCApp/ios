//
//  EventsViewController.swift
//  SlugRoute
//
//  Created by Brad Bernard on 5/25/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import UIKit

class EventsTableViewController: UITableViewController {
   
    var events : [Event] = []
    var nameLabel:String!
    var dateLabel:String!
    var descriptionLabel:String!
    var urlImage:UIImage!

   
    override func viewDidLoad()
    {
      super.viewDidLoad()
      self.navigationItem.title = "Events";
      //getEvents()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   func getEvents()
   {
    
     let request = NSMutableURLRequest()
     request.URL = NSURL(string: "http://www.triton.cloud:8081/events/getEvents")!
     request.HTTPMethod = "GET"
     request.setValue("8e942960-1c0b-48be-a4cc-c50582f142d3", forHTTPHeaderField: "X-Triton-App")
     var response:NSURLResponse?
     let error:NSError? = nil
     var responseData = ""
     do{
        let dataGet = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
        if (error == nil) {
            responseData = String(data: dataGet, encoding: NSUTF8StringEncoding)!
            // Parse the data
        } else {
            // Handle error
            print("synchronous request error: \(error)")
        }
     
     } catch {
        print("json error: \(error)")
     }

    
    // convert String to NSData
    let data: NSData = responseData.dataUsingEncoding(NSUTF8StringEncoding)!
    
    
    do {
        // convert 'AnyObject' to Array<Business>
        let anyObj: AnyObject? = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
        if let anyObj = anyObj {
            if let elems = anyObj as? Array<Dictionary<String,AnyObject>> {
                for item in elems {
                    events.append(Event(data: item))
                    self.tableView.reloadData()
                }
            }
        }
    } catch {
            print("json error: \(error)")
    }
        
   }

   
   override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
   {
      return events.count
   }
   
   override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let event = events[indexPath.row] as Event
      let cell = tableView.dequeueReusableCellWithIdentifier("EventTableCell", forIndexPath: indexPath) as! EventTableCell
      
      cell.nameLabel.text           = event.name
      cell.dateLabel.text           = event.date
      cell.descriptionLabel.text    = event.descriptionText
    
      if let url = NSURL(string: event.url) {
          if let data = NSData(contentsOfURL: url){
              if let imageUrl = UIImage(data: data) {
                  cell.urlImage.image = imageUrl  // you can use your imageUrl UIImage (note: imageUrl it is not an optional here)
              }
          }
      }
    
      return cell
   }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get Cell Label
        let indexPath = self.tableView.indexPathForSelectedRow
        let currentCell = self.tableView.cellForRowAtIndexPath(indexPath!) as! EventTableCell;
        nameLabel = currentCell.nameLabel!.text
        dateLabel = currentCell.dateLabel!.text
        descriptionLabel = currentCell.descriptionLabel!.text
        urlImage = currentCell.urlImage!.image
        if (segue.identifier == "toSummary") {
            // initialize new view controller and cast it as your view controller
            let viewController = segue.destinationViewController as! EventViewController
            // your new view controller should have property that will store passed value
            viewController.nameLabel = nameLabel
            viewController.dateLabel = dateLabel
            viewController.descriptionLabel = descriptionLabel
            viewController.image = urlImage
            
        }
        
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
