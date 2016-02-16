//
//  MealsTableViewController.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 9/16/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation
import UIKit

class BreakfastItem: NSObject {
    var name: String = ""
    var attributes: Array<String> = []
    
    init(name: String, attr: Array<String>?) {
        self.name = name
        self.attributes = attr!
    }
}

class LunchItem: NSObject {
    var name: String = ""
    var attributes: Array<String> = []
    
    init(name: String, attr: Array<String>?) {
        self.name = name
        self.attributes = attr!
    }
}

class DinnerItem: NSObject {
    var name: String = ""
    var attributes: Array<String> = []
    
    init(name: String, attr: Array<String>?) {
        self.name = name
        self.attributes = attr!
    }
}

class MealsTableViewController: UITableViewController {
    var breakfastItems : Array<BreakfastItem> = []
    var lunchItems : Array<LunchItem> = []
    var dinnerItems : Array<DinnerItem> = []
    var collegeName : String = ""
    var mealName : String = ""
    var items : AnyObject = ""
    var mealCount : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = collegeName
        
        
        //parsing JSON (type AnyObject) puts college's meals into arrays.
        if let jsonResult = items as? Dictionary<String, AnyObject> {
            for(key, value) in jsonResult{
                mealCount++;
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
                            self.breakfastItems.append(BreakfastItem(name: name, attr: attr as? Array<String>))
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
                            self.lunchItems.append(LunchItem(name: name, attr: attr as? Array<String>))
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
                            self.dinnerItems.append(DinnerItem(name: name, attr: attr as? Array<String>))
                        }
                    }
                    
                }
                else{
                    
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MealTableCell", forIndexPath: indexPath) as! MealTableCell
        
        if(indexPath.row == 0){
            cell.meal.text             = "Breakfast"
        }
        else if(indexPath.row == 1){
            cell.meal.text             = "Lunch"
        }
        else{
            cell.meal.text             = "Dinner"
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get Cell Label
        let indexPath = self.tableView.indexPathForSelectedRow!;
        let currentCell = self.tableView.cellForRowAtIndexPath(indexPath) as! MealTableCell;
        if (segue.identifier == "toMeal") {
            if(currentCell.meal!.text! == "Breakfast"){
                // initialize new view controller and cast it as your view controller
                var viewController = segue.destinationViewController as! MealsViewController
                // your new view controller should have property that will store passed value
                viewController.collegeName = self.collegeName
                viewController.mealName = "Breakfast"
                viewController.breakfastItems = self.breakfastItems
            }
            else if(currentCell.meal!.text! == "Lunch"){
                // initialize new view controller and cast it as your view controller
                var viewController = segue.destinationViewController as! MealsViewController
                // your new view controller should have property that will store passed value
                viewController.collegeName = self.collegeName
                viewController.mealName = "Lunch"
                viewController.lunchItems = self.lunchItems
            }
            else if(currentCell.meal!.text! == "Dinner"){
                // initialize new view controller and cast it as your view controller
                var viewController = segue.destinationViewController as! MealsViewController
                // your new view controller should have property that will store passed value
                viewController.collegeName = self.collegeName
                viewController.mealName = "Dinner"
                viewController.dinnerItems = self.dinnerItems
            }
            else{
                // initialize new view controller and cast it as your view controller
                var viewController = segue.destinationViewController as! MealsViewController
                // your new view controller should have property that will store passed value
                viewController.collegeName = self.collegeName
                viewController.dinnerItems = self.dinnerItems
            }
            
        }
        
    }
    
    
}