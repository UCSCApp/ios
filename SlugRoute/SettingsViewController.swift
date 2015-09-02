//
//  SettingsViewController.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 9/2/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation
import UIKit

class SettingItem: NSObject {
    
    var settingName : String?
    var switchState : Bool?
    
    init (settingName: String?, switchState : Bool?) {
        super.init()
        self.settingName = settingName
        self.switchState = switchState
    }
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var copyright: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        // Do any additional setup after loading the view.
        
        //Must be somewhere in the view! License Info.
        copyright.text = GMSServices.openSourceLicenseInfo()
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var settings : [SettingItem] = [
        SettingItem(settingName: "Setting 1", switchState: true),
        SettingItem(settingName: "Setting 2", switchState: true)
    ]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 2
    }
    
    func tableView(_tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SettingsTableViewCell") as! SettingsTableViewCell
        
        let settingItem = settings[indexPath.row]
        cell.notification.text = settingItem.settingName
        cell.settingSwitch.enabled = settingItem.switchState!
        
        return cell
    }
    
}