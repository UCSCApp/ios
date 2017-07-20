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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
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
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {

        if(tableView == breakfastTable){
            let cell = tableView.dequeueReusableCell(withIdentifier: "breakfastCell", for: indexPath) as! BreakfastTableCell
            
            if(mealName == "Breakfast"){
                let breakfast = breakfastItems[indexPath.row] as BreakfastItem
                
                cell.breakfastName.text                = breakfast.name
                cell.attributes                        = breakfast.attributes
                
            }
            else if(mealName == "Lunch"){
                let lunch = lunchItems[indexPath.row] as LunchItem
                
                cell.breakfastName.text                = lunch.name
                cell.attributes                        = lunch.attributes
                
            }
            else{
                let dinner = dinnerItems[indexPath.row] as DinnerItem
                
                cell.breakfastName.text                = dinner.name
                cell.attributes                        = dinner.attributes
                
            }
                
                for image: String in cell.attributes{
                    if(image == "eggs"){
                        cell.egg.image = UIImage(named:"ic_egg")
                    }
                    else if(image == "soy"){
                        cell.soy.image = UIImage(named:"ic_soy.png")
                    }
                    else if(image == "veggie"){
                        cell.veggie.image = UIImage(named:"ic_veggie.png")
                    }
                    else if(image == "milk"){
                        cell.milk.image = UIImage(named:"ic_milk.png")
                    }
                    else if(image == "gluten"){
                        cell.gluten.image = UIImage(named:"ic_glutten.png")
                    }
                    else if(image == "nuts"){
                        cell.nuts.image = UIImage(named:"ic_nuts.png")
                    }
                    else if(image == "fish"){
                        cell.fish.image = UIImage(named:"ic_fish.png")
                    }
                    else if(image == "pork"){
                        cell.pork.image = UIImage(named:"ic_pork.png")
                    }
                    else if(image == "vegan"){
                        cell.vegan.image = UIImage(named:"ic_vegan.png")
                    }
                    else if(image == "beef"){
                        cell.beef.image = UIImage(named:"ic_beef.png")
                    }
                    else if(image == "allergy free"){
                        cell.allergy.image = UIImage(named:"ic_allergy_free.png")
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "breakfastCell", for: indexPath) as! BreakfastTableCell
            return cell
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
