//
//  MealsViewController.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 9/10/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation
import UIKit



class MealsViewController: UIViewController{
    var breakfastItems : Array<BreakfastItem> = []
    var lunchItems : Array<LunchItem> = []
    var dinnerItems : Array<DinnerItem> = []
    var collegeName : String = ""
    var mealName : String = ""
    


    
    @IBOutlet weak var breakfastTable: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.title = mealName
        

        
        // Do any additional setup after loading the view.
    }
    
    // --- UITableViewDataSource protocol ---
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(mealName == "Breakfast"){
            return breakfastItems.count
        }
        else if(mealName == "Lunch"){
            return lunchItems.count
        }
        else if(mealName == "Dinner"){
            return dinnerItems.count
        }
        else{
            return 1
        }
        

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        if(tableView == breakfastTable){
            let cell = tableView.dequeueReusableCellWithIdentifier("breakfastCell", forIndexPath: indexPath) as! BreakfastTableCell
            
            if(mealName == "Breakfast"){
                let breakfast = breakfastItems[indexPath.row] as BreakfastItem
                
                cell.textLabel!.text                = breakfast.name
                cell.attributes                        = breakfast.attributes
                
            }
            else if(mealName == "Lunch"){
                let lunch = lunchItems[indexPath.row] as LunchItem
                
                cell.textLabel!.text                = lunch.name
                cell.attributes                        = lunch.attributes
                
            }
            else{
                let dinner = dinnerItems[indexPath.row] as DinnerItem
                
                cell.textLabel!.text                = dinner.name
                cell.attributes                        = dinner.attributes
                
            }
                
                for image: String in cell.attributes{
                    if(image == "eggs"){
                        cell.egg.image = UIImage(named:"ic_egg")
                        let eggtap = UITapGestureRecognizer(target: self, action: #selector(MealsViewController.eggtappedMe))
                        cell.egg.addGestureRecognizer(eggtap)
                        cell.egg.userInteractionEnabled = true
                    }
                    else if(image == "soy"){
                        cell.soy.image = UIImage(named:"ic_soy.png")
                        let soytap = UITapGestureRecognizer(target: self, action: #selector(MealsViewController.soytappedMe))
                        cell.soy.addGestureRecognizer(soytap)
                        cell.soy.userInteractionEnabled = true
                    }
                    else if(image == "veggie"){
                        cell.veggie.image = UIImage(named:"ic_veggie.png")
                        let veggietap = UITapGestureRecognizer(target: self, action: #selector(MealsViewController.veggietappedMe))
                        cell.veggie.addGestureRecognizer(veggietap)
                        cell.veggie.userInteractionEnabled = true
                    }
                    else if(image == "milk"){
                        cell.milk.image = UIImage(named:"ic_milk.png")
                        let milktap = UITapGestureRecognizer(target: self, action: #selector(MealsViewController.milktappedMe))
                        cell.milk.addGestureRecognizer(milktap)
                        cell.milk.userInteractionEnabled = true
                    }
                    else if(image == "gluten"){
                        cell.gluten.image = UIImage(named:"ic_gluten.png")
                        let gluttentap = UITapGestureRecognizer(target: self, action: #selector(MealsViewController.gluttentappedMe))
                        cell.gluten.addGestureRecognizer(gluttentap)
                        cell.gluten.userInteractionEnabled = true
                    }
                    else if(image == "nuts"){
                        cell.nuts.image = UIImage(named:"ic_nuts.png")
                        let nutstap = UITapGestureRecognizer(target: self, action: #selector(MealsViewController.nutstappedMe))
                        cell.nuts.addGestureRecognizer(nutstap)
                        cell.nuts.userInteractionEnabled = true
                    }
                    else if(image == "fish"){
                        cell.fish.image = UIImage(named:"ic_fish.png")
                        let fishtap = UITapGestureRecognizer(target: self, action: #selector(MealsViewController.fishtappedMe))
                        cell.fish.addGestureRecognizer(fishtap)
                        cell.fish.userInteractionEnabled = true
                    }
                    else if(image == "pork"){
                        cell.pork.image = UIImage(named:"ic_pork.png")
                        let porktap = UITapGestureRecognizer(target: self, action: #selector(MealsViewController.porktappedMe))
                        cell.pork.addGestureRecognizer(porktap)
                        cell.pork.userInteractionEnabled = true
                    }
                    else if(image == "vegan"){
                        cell.vegan.image = UIImage(named:"ic_vegan.png")
                        let vegantap = UITapGestureRecognizer(target: self, action: #selector(MealsViewController.vegantappedMe))
                        cell.vegan.addGestureRecognizer(vegantap)
                        cell.vegan.userInteractionEnabled = true
                    }
                    else if(image == "beef"){
                        cell.beef.image = UIImage(named:"ic_beef.png")
                        let beeftap = UITapGestureRecognizer(target: self, action: #selector(MealsViewController.beeftappedMe))
                        cell.beef.addGestureRecognizer(beeftap)
                        cell.beef.userInteractionEnabled = true
                    }
                    else if(image == "allergy free"){
                        cell.allergy.image = UIImage(named:"ic_allergy_free.png")
                        let allergytap = UITapGestureRecognizer(target: self, action: #selector(MealsViewController.allergytappedMe))
                        cell.allergy.addGestureRecognizer(allergytap)
                        cell.allergy.userInteractionEnabled = true
                    }
                    else{
                        //filler for now
                        cell.allergy.image = UIImage(named:"")
                    }
                }
               
            
            return cell

        }
        else{
            //filler for now 
            let cell = tableView.dequeueReusableCellWithIdentifier("breakfastCell", forIndexPath: indexPath) as! BreakfastTableCell
            return cell
        }
    }
    
    func eggtappedMe()
    {
        let alert = UIAlertView()
        alert.title = "Contains:"
        alert.message = "eggs"
        alert.show()
        // Delay the dismissal by 5 seconds
        let delay = 3.0 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            alert.dismissWithClickedButtonIndex(-1, animated: true)
        })
    }
    
    
    func allergytappedMe()
    {
        let alert = UIAlertView()
        alert.title = "Allergy free"
        alert.message = ""
        alert.show()
        // Delay the dismissal by 5 seconds
        let delay = 3.0 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            alert.dismissWithClickedButtonIndex(-1, animated: true)
        })
    }
    
    func beeftappedMe()
    {
        let alert = UIAlertView()
        alert.title = "Contains:"
        alert.message = "beef"
        alert.show()
        // Delay the dismissal by 5 seconds
        let delay = 3.0 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            alert.dismissWithClickedButtonIndex(-1, animated: true)
        })
    }
    
    func nutstappedMe()
    {
        let alert = UIAlertView()
        alert.title = "Contains:"
        alert.message = "nuts"
        alert.show()
        // Delay the dismissal by 5 seconds
        let delay = 3.0 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            alert.dismissWithClickedButtonIndex(-1, animated: true)
        })
    }
    
    func fishtappedMe()
    {
        let alert = UIAlertView()
        alert.title = "Contains:"
        alert.message = "fish"
        alert.show()
        // Delay the dismissal by 5 seconds
        let delay = 3.0 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            alert.dismissWithClickedButtonIndex(-1, animated: true)
        })
    }
    
    func soytappedMe()
    {
        let alert = UIAlertView()
        alert.title = "Contains:"
        alert.message = "soy"
        alert.show()
        // Delay the dismissal by 5 seconds
        let delay = 3.0 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            alert.dismissWithClickedButtonIndex(-1, animated: true)
        })
    }
    
    func milktappedMe()
    {
        let alert = UIAlertView()
        alert.title = "Contains:"
        alert.message = "milk"
        alert.show()
        // Delay the dismissal by 5 seconds
        let delay = 3.0 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            alert.dismissWithClickedButtonIndex(-1, animated: true)
        })
    }
    
    func gluttentappedMe()
    {
        let alert = UIAlertView()
        alert.title = "Contains:"
        alert.message = "glutten"
        alert.show()
        // Delay the dismissal by 5 seconds
        let delay = 3.0 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            alert.dismissWithClickedButtonIndex(-1, animated: true)
        })
    }
    
    func veggietappedMe()
    {
        let alert = UIAlertView()
        alert.title = "Contains:"
        alert.message = "veggie"
        alert.show()
        // Delay the dismissal by 5 seconds
        let delay = 3.0 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            alert.dismissWithClickedButtonIndex(-1, animated: true)
        })
    }
    
    func vegantappedMe()
    {
        let alert = UIAlertView()
        alert.title = "Contains:"
        alert.message = "vegan"
        alert.show()
        // Delay the dismissal by 5 seconds
        let delay = 3.0 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            alert.dismissWithClickedButtonIndex(-1, animated: true)
        })
    }
    
    func porktappedMe()
    {
        let alert = UIAlertView()
        alert.title = "Contains:"
        alert.message = "pork"
        alert.show()
        // Delay the dismissal by 5 seconds
        let delay = 3.0 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            alert.dismissWithClickedButtonIndex(-1, animated: true)
        })
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
