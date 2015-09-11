//
//  MealsViewController.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 9/10/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation
import UIKit

class BreakfastItem: NSObject {
    var name: String = ""
    var attributes: NSArray = []
    
    init(name: String, attr: NSArray?) {
        self.name = name
        self.attributes = attr!
    }
}

class LunchItem: NSObject {
    var name: String = ""
    var attributes: NSArray = []
    
    init(name: String, attr: NSArray?) {
        self.name = name
        self.attributes = attr!
    }
}

class DinnerItem: NSObject {
    var name: String = ""
    var attributes: NSArray = []
    
    init(name: String, attr: NSArray?) {
        self.name = name
        self.attributes = attr!
    }
}

class MealsViewController: UIViewController{
    var breakfastItems : Array<BreakfastItem> = []
    var lunchItems : Array<LunchItem> = []
    var dinnerItems : Array<DinnerItem> = []
    var collegeName : String = ""
    var items : AnyObject = ""

    @IBOutlet weak var breakfastLabel: UILabel!
    
    @IBOutlet weak var lunchLabel: UILabel!
    
    @IBOutlet weak var dinnerLabel: UILabel!
    
    @IBOutlet weak var breakfastTable: UITableView!
    
    @IBOutlet weak var lunchTable: UITableView!
    
    @IBOutlet weak var dinnerTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = collegeName
        breakfastLabel.text = "Breakfast"
        lunchLabel.text = "Lunch"
        dinnerLabel.text = "Dinner"
        
        //parsing JSON (type AnyObject)
        if let jsonResult = items as? Dictionary<String, AnyObject> {
            for(key, value) in jsonResult{
                if (key == "breakfast"){
                    if let jsonBreakfast = value as? Array<Dictionary<String, AnyObject>> {
                        for food in jsonBreakfast{
                            var name = ""
                            var attr = []
                            for (key,value) in food{
                                if(key == "name"){
                                    name = value as! String
                                }
                                else{
                                    attr = value as! NSArray
                                }
                            }
                            self.breakfastItems.append(BreakfastItem(name: name, attr: attr))
                        }
                    }
                }
                else if (key == "lunch"){
                    if let jsonLunch = value as? Array<Dictionary<String, AnyObject>> {
                        for food in jsonLunch{
                            var name = ""
                            var attr = []
                            for (key,value) in food{
                                if(key == "name"){
                                    name = value as! String
                                }
                                else{
                                    attr = value as! NSArray
                                }
                            }
                            self.lunchItems.append(LunchItem(name: name, attr: attr))
                        }
                    }
                }
                else if (key == "dinner"){
                    if let jsonDinner = value as? Array<Dictionary<String, AnyObject>> {
                        for food in jsonDinner{
                            var name = ""
                            var attr = []
                            for (key,value) in food{
                                if(key == "name"){
                                    name = value as! String
                                }
                                else{
                                    attr = value as! NSArray
                                }
                            }
                            self.dinnerItems.append(DinnerItem(name: name, attr: attr))
                        }
                    }
                
                }
                else{
                
                }
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(tableView == breakfastTable){
            return breakfastItems.count
        }
        else if(tableView == lunchTable){
            return lunchItems.count
        }
        else if(tableView == dinnerTable){
            return dinnerItems.count
        }
        else{
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(tableView == breakfastTable){
            let breakfast = breakfastItems[indexPath.row] as BreakfastItem
            let cell = tableView.dequeueReusableCellWithIdentifier("breakfastCell", forIndexPath: indexPath) as! BreakfastTableCell
        
            cell.breakfastName.text                = breakfast.name
            cell.attributes                        = breakfast.attributes

            return cell
        }
        else if(tableView == lunchTable){
            let lunch = lunchItems[indexPath.row] as LunchItem
            let cell = tableView.dequeueReusableCellWithIdentifier("lunchCell", forIndexPath: indexPath) as! LunchTableCell
            
            cell.lunchName.text                    = lunch.name
            cell.attributes                        = lunch.attributes
            
            return cell
        
        }
        else if(tableView == dinnerTable){
            let dinner = dinnerItems[indexPath.row] as DinnerItem
            let cell = tableView.dequeueReusableCellWithIdentifier("dinnerCell", forIndexPath: indexPath) as! DinnerTableCell
            
            cell.dinnerName.text                   = dinner.name
            cell.attributes                        = dinner.attributes
            
            return cell
        
        }
        else{
            //filler for now 
            let cell = tableView.dequeueReusableCellWithIdentifier("breakfastTable", forIndexPath: indexPath) as! DinnerTableCell
            return cell
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}