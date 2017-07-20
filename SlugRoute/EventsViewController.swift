//
//  EventsViewController.swift
//  SlugRoute
//
//  Created by Brad Bernard on 5/25/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import UIKit
import Alamofire
//import SwiftyJSON

class EventsViewController: UITableViewController {
   
    var events : [Event] = []
    var nameLabel:String!
    var dateLabel:String!
    var descriptionLabel:String!
    var urlImage:UIImage!

   
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
    /*
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
     */
    var json =
    "[{\"name\":\"Edge of Eden\",\"date\":\"July 18th 10pm 2am\",\"description\":\"Musical festival with a finale by Squidward Tortellini\",\"url\":\"http://tmcdigitalmedia.com/wp-content/uploads/2013/03/2_27_13-FSNA_Flyer_web_versionF.jpeg\"},{\"name\":\"Holi Festival\",\"date\":\"May 25th 10am 12pm\",\"description\":\"This event is super fun and super great!\",\"url\":\"https://uh.collegiatelink.net/images/W460xL600/0/noshadow/Event/c40dcb200abb430c9c20c632473b959f.jpg\"},{\"name\":\"Meeting\",\"date\":\"May 31st 2pm 4pm\",\"description\":\"Simba is asking you to go to this super boring meeting thing again\",\"url\":\"http://img01.deviantart.net/d568/i/2012/062/a/1/steam_event_flyer_design_by_danwilko-d4rke4s.jpg\"},{\"name\":\"French Fried\",\"date\":\"January 1st 13am 7pm\",\"description\":\"TBH Im not entirely sure what this is, so please dont come to this event at all, This desciption is purposely awkwardly long to hopefully break all of your apps becase I am a devious motherfucker like that. So I am still writing random shit now to break your apps in my malicious ways. I wonder if anyone will actually handle this case. I sure as hell wouldnt. Who the fuck actually spends the time to write this long a description about a dumb event called French Fried holy fuck. Btw I hope you arent actually reading this when you should be coding the solution to fixing your description box that just broke due to my malicious test script. Unless of course it worked in which case, you should probably stop reading this anyway because holy fuck this is a long motha fucking description. It is called French Fried. Starts at 13am. Be there.\",\"url\":\"http://www.hiddenorchestra.com/wp-content/gallery/flyers-and-posters/soundcrash-daedelus_-a5-flyer-01.jpg\"},{\"name\":\"Short but sweet\",\"date\":\"never\",\"description\":\"meow\",\"url\":\"https://www.designmaz.net/wp-content/uploads/2014/11/psd-event-flyer-templates.jpg\"}]"
    
    // convert String to NSData
    var data: Data = json.data(using: String.Encoding.utf8)!
    var error: NSError?
    
    // convert NSData to 'AnyObject'
    let anyObj: AnyObject? = JSONSerialization.JSONObjectWithData(data, options: JSONSerialization.ReadingOptions(0),
        error: &error)
    
    // convert 'AnyObject' to Array<Business>
    var jsonObj = JSON(anyObj!)
    self.parseEvents(jsonObj)
   }

   
   func parseEvents(_ data : JSON)
   {
      for(key : String, json : JSON) in data
      {
         events.append(Event(data: json))
      }
    
      self.tableView.reloadData()
   }
   
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
   {
      return events.count
   }
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let event = events[indexPath.row] as Event
      let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableCell", for: indexPath) as! EventTableCell
      
      cell.nameLabel.text           = event.name
      cell.dateLabel.text           = event.date
      cell.descriptionLabel.text    = event.descriptionText
    
      if let url = URL(string: event.url) {
          if let data = try? Data(contentsOf: url){
              if let imageUrl = UIImage(data: data) {
                  cell.urlImage.image = imageUrl  // you can use your imageUrl UIImage (note: imageUrl it is not an optional here)
              }
          }
      }
    
      return cell
   }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get Cell Label
        let indexPath = self.tableView.indexPathForSelectedRow;
        let currentCell = self.tableView.cellForRow(at: indexPath!) as! EventTableCell;
        nameLabel = currentCell.nameLabel!.text
        dateLabel = currentCell.dateLabel!.text
        descriptionLabel = currentCell.descriptionLabel!.text
        urlImage = currentCell.urlImage!.image
        if (segue.identifier == "toSummary") {
            // initialize new view controller and cast it as your view controller
            let viewController = segue.destination as! EventViewController
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
