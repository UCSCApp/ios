//
//  MealTableCell.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 9/16/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation
import UIKit

class MealTableCell: UITableViewCell {
    

    @IBOutlet weak var meal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
