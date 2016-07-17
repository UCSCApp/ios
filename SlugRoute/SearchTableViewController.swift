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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSizeMake(300, 300)
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
        
        return cell!
    }
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.filteredFacilities.removeAll(keepCapacity: false)
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (self.namesOfAllFacilities as NSArray).filteredArrayUsingPredicate(searchPredicate)
        self.filteredFacilities = array as! [String]
        self.tableView.reloadData()
    }

}