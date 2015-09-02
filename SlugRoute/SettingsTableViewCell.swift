//
//  SettingsTableViewCell.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 9/2/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation
import UIKit



class SettingsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var settingSwitch: UISwitch!

    @IBAction func handledSettingSwitch(sender: UISwitch) {
    }

    @IBOutlet weak var notification: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        

    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
    
}