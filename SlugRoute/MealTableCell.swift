//
//  BreakfastTableCell.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 9/10/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation
import UIKit

class MealTableCell: UITableViewCell {
    
    @IBOutlet weak var mealName: UILabel!
    
    @IBOutlet weak var allergy: UIImageView!
    @IBOutlet weak var halal: UIImageView!
    @IBOutlet weak var beef: UIImageView!
    @IBOutlet weak var milk: UIImageView!
    @IBOutlet weak var pork: UIImageView!
    @IBOutlet weak var nuts: UIImageView!
    @IBOutlet weak var egg: UIImageView!
    @IBOutlet weak var soy: UIImageView!
    @IBOutlet weak var fish: UIImageView!
    @IBOutlet weak var vegan: UIImageView!
    @IBOutlet weak var glutten: UIImageView!
    
    @IBOutlet weak var veggie: UIImageView!
    var attributes: Array<String> = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
