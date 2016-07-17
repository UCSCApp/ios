//
//  DiningTableCell.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 6/8/16.
//  Copyright © 2016 UCSC iOS. All rights reserved.
//

import Foundation
import UIKit

class DiningTableCell: UITableViewCell {
    
    
    @IBOutlet weak var college: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
