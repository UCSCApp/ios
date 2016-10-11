//
//  SearchTableViewController.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 7/17/16.
//  Copyright © 2016 UCSC iOS. All rights reserved.
//

import Foundation
import UIKit

class SearchTableViewController: UITableViewController, UISearchResultsUpdating{

    var allFacilities : Dictionary<String,Array<Facility>> = [:]
    var namesOfAllFacilities : Array<String> = []
    var resultSearchController = UISearchController()
    var filteredFacilities = [String]()
    var mapView = GMSMapView()
    let userDefaults = NSUserDefaults.standardUserDefaults() // variable for shared preferences
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSizeMake(300, 300)
        let camera = GMSCameraPosition.cameraWithLatitude(36.99578157522153, longitude:
            -122.058908423001, zoom: 14)
        self.mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        
        mapView.myLocationEnabled = true

        self.preferredContentSize = self.tableView.contentSize
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater = self
        
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        self.resultSearchController.searchBar.sizeToFit()
        
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        self.tableView.reloadData()
        
        
        for (_,value) in self.allFacilities {
            for elem in value {
                self.namesOfAllFacilities.append(elem.name)
            }
        }
        
        //self.searchTableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.resultSearchController.active {
            return self.filteredFacilities.count
        } else {
            return self.namesOfAllFacilities.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("searchCell",forIndexPath: indexPath) as UITableViewCell?
        
        if self.resultSearchController.active {
            cell!.textLabel?.text = self.filteredFacilities[indexPath.row]
        } else {
            cell!.textLabel?.text = self.namesOfAllFacilities[indexPath.row]
        }
        let theChecked = userDefaults.objectForKey((cell!.textLabel?.text)!)
        if theChecked != nil {
            let theCheckedInt = userDefaults.objectForKey((cell!.textLabel?.text)!) as! Int
            if theCheckedInt == 0 {
                cell!.accessoryType = .None
            } else {
                cell!.accessoryType = .Checkmark
            }
        } else {
            cell!.accessoryType = .None
            userDefaults.setObject(0, forKey: cell!.textLabel!.text!)
        }
        return cell!
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
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.filteredFacilities.removeAll(keepCapacity: false)
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (self.namesOfAllFacilities as NSArray).filteredArrayUsingPredicate(searchPredicate)
        self.filteredFacilities = array as! [String]
        self.tableView.reloadData()
    }

}
