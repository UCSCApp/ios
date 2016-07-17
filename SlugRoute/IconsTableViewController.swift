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
    var checked : Array<Bool> = [] // Have an array equal to the number of cells in your table
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.preferredContentSize = CGSizeMake(300, 300)
        

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
        let defaults = NSUserDefaults.standardUserDefaults()
        let theChecked = defaults.objectForKey("checked") as? Array<Bool> ?? Array<Bool>()
        if theChecked.count != 0 {
            for elem in theChecked {
                if elem == false {
                    cell.accessoryType = .None
                } else {
                    cell.accessoryType = .Checkmark
                }
            }
        }
        cell.nameLabel.text           = self.allFacilities.keys[index]
        
        
        return cell
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if cell.accessoryType == .Checkmark {
                cell.accessoryType = .None
                self.checked[indexPath.row] = false
                let userDefaults = NSUserDefaults.standardUserDefaults()
                userDefaults.setObject(self.checked, forKey: "checked")
                userDefaults.synchronize()
            } else {
                cell.accessoryType = .Checkmark
                self.checked[indexPath.row] = true
                let userDefaults = NSUserDefaults.standardUserDefaults()
                userDefaults.setObject(self.checked, forKey: "checked")
                userDefaults.synchronize()
            }
        }    
    }
    
    
    
    
}
