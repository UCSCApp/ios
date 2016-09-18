//
//  IconsViewController.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 7/12/16.
//  Copyright © 2016 UCSC iOS. All rights reserved.
//

import Foundation
import UIKit

class IconsTableViewController: UITableViewController {
    
    var allFacilities : Dictionary<String,Array<Facility>> = [:]
    //var checked : [String] = [] // an array for all checked types (pass data to base VC)
    let userDefaults = NSUserDefaults.standardUserDefaults() // variable for shared preferences
    var mapView = GMSMapView()
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        //set map that will be updated
        self.preferredContentSize = CGSizeMake(300, 300)
        let camera = GMSCameraPosition.cameraWithLatitude(36.99578157522153, longitude:
            -122.058908423001, zoom: 14)
        self.mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        
        mapView.myLocationEnabled = true

    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //http://stackoverflow.com/questions/30059704/uitableviewcell-checkmark-to-be-toggled-on-and-off-when-tapped-swift
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return allFacilities.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FacilityTableCell", forIndexPath: indexPath) as! FacilityTableCell
        
        let index = self.allFacilities.startIndex.advancedBy(indexPath.row)
        let theChecked = userDefaults.objectForKey(self.allFacilities.keys[index]) as! Int
        if theChecked == 0 {
            cell.accessoryType = .None
        } else {
            cell.accessoryType = .Checkmark
        }

        cell.nameLabel.text           = self.allFacilities.keys[index]
        cell.textLabel!.text          = self.allFacilities.keys[index]
        cell.textLabel!.hidden        = true
        
        
        return cell
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            //if the type was checked uncheck it and vice versa. then save it in preferences
            //self.checked.filter()... is for non shared preferences way
            if cell.accessoryType == .Checkmark {
                cell.accessoryType = .None
                userDefaults.setObject(0, forKey: (cell.textLabel?.text)!)
                userDefaults.synchronize()
                //self.checked.filter() {$0 != (cell.textLabel?.text)!}
            } else {
                cell.accessoryType = .Checkmark
                userDefaults.setObject(1, forKey: (cell.textLabel?.text)!)
                userDefaults.synchronize()
                //self.checked.append((cell.textLabel?.text)!);
            }

        }
    }
    
    
    
    
}
