//
//  DiningTableViewController.swift
//  SlugLife
//
//  Created by Karol josef Bustamante on 9/10/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation
import UIKit

class DiningTableViewController: UITableViewController{
    var diningHallNames : Array<String> = []
    var dining : [DiningMenu] = []
    var collegeName : String = ""
    var college8Items : Dictionary<String, AnyObject> = [:]
    var college9Items : Dictionary<String, AnyObject> = [:]
    var collegeCowellItems : Dictionary<String, AnyObject> = [:]
    var collegeCrownItems : Dictionary<String, AnyObject> = [:]
    var collegePorterItems : Dictionary<String, AnyObject> = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Dining";
        
        //getDining()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getDining()
    {
        //http://ec2-52-10-36-144.us-west-2.compute.amazonaws.com/dining/
        let collegeNamesRequest = NSURLRequest(URL: NSURL(string: "http://ec2-52-10-36-144.us-west-2.compute.amazonaws.com:8080/dining")!)
        let collegeEightRequest = NSURLRequest(URL: NSURL(string: "http://ec2-52-10-36-144.us-west-2.compute.amazonaws.com:8080/dining/menu?name=College%20Eight%20%26%20Oakes")!)
        let collegeNineRequest = NSURLRequest(URL: NSURL(string: "http://ec2-52-10-36-144.us-west-2.compute.amazonaws.com:8080/dining/menu?name=College%20Nine%20%26%20College%20Ten")!)
        let collegePorterRequest = NSURLRequest(URL: NSURL(string: "http://ec2-52-10-36-144.us-west-2.compute.amazonaws.com:8080/dining/menu?name=Porter%20%26%20Kresge")!)
        let collegeCowellRequest = NSURLRequest(URL: NSURL(string: "http://ec2-52-10-36-144.us-west-2.compute.amazonaws.com:8080/dining/menu?name=Cowell%20%26%20Stevenson")!)
        let collegeCrownRequest = NSURLRequest(URL: NSURL(string: "http://ec2-52-10-36-144.us-west-2.compute.amazonaws.com:8080/dining/menu?name=Crown%20%26%20Merrill")!)
        
        //get college names
        parseNamesResponseData(collegeNamesRequest)
        //get a college's menus
        let parseCollegeCrownRequest = parseResponseData(collegeCrownRequest) as! Dictionary<String, AnyObject>
        if (!parseCollegeCrownRequest.isEmpty) {
            self.collegeCrownItems = parseCollegeCrownRequest
        }
        
        let parseCollegeEightRequest = parseResponseData(collegeEightRequest) as! Dictionary<String, AnyObject>
        if (!parseCollegeEightRequest.isEmpty) {
            self.college8Items = parseCollegeCrownRequest
        }
        let parseCollegeNineRequest  = parseResponseData(collegeNineRequest) as! Dictionary<String, AnyObject>
        if (!parseCollegeNineRequest.isEmpty) {
            self.college9Items = parseCollegeCrownRequest
        }
        let parsePorterRequest  = parseResponseData(collegePorterRequest) as! Dictionary<String, AnyObject>
        if (!parsePorterRequest.isEmpty) {
            self.collegePorterItems = parseCollegeCrownRequest
        }
        let parseCollegeCowellRequest  = parseResponseData(collegeCowellRequest) as! Dictionary<String, AnyObject>
        if (!parseCollegeCowellRequest.isEmpty) {
            self.collegeCowellItems = parseCollegeCrownRequest
        }
        

    }
    
    
    func parseNamesResponseData(request: NSURLRequest) {
        var response:NSURLResponse?
        let error:NSError? = nil
        var responseData = ""
        do{
            let dataGet = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
            if (error == nil) {
                responseData = String(data: dataGet, encoding: NSUTF8StringEncoding)!
                // Parse the data
            } else {
                // Handle error
            }
            
        } catch {
            print("json error: \(error)")
        }
        
        //parse the json data
        let data: NSData = responseData.dataUsingEncoding(NSUTF8StringEncoding)!
        do{
            let anyObj: AnyObject? = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            if let anyObj = anyObj {
                diningHallNames = Dining(data: anyObj as! Array<String>).collegeNames
            } else {
                // more error handling
            }
        }
        catch{
            //error handling
        }
    }
    
    func parseResponseData(request: NSURLRequest) -> AnyObject {
        var response:NSURLResponse?
        let error:NSError? = nil
        var responseData = ""
        do{
            let dataGet = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
            if (error == nil) {
                responseData = String(data: dataGet, encoding: NSUTF8StringEncoding)!
                // Parse the data
            } else {
                // Handle error
            }
            
        } catch {
            print("json error: \(error)")
        }
        
        //parse the json data
        // convert String to NSData
        let data: NSData = responseData.dataUsingEncoding(NSUTF8StringEncoding)!
        // convert NSData to 'AnyObject'
        do{
            let anyObj: AnyObject? = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            if let anyObj = anyObj {
                return DiningMenu(data: anyObj).items
            } else {
                // more error handling
            }
        }
        catch{
            //error handling
        }
        return [:]
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = self.tableView.indexPathForSelectedRow
        let currentCell = self.tableView.cellForRowAtIndexPath(indexPath!) as UITableViewCell?
        let yourNextViewController = (segue.destinationViewController as! MealsTableViewController)
        print(currentCell!.textLabel!.text)
        if (currentCell!.textLabel!.text == "College Eight & Oakes") {
            yourNextViewController.items = college8Items
            yourNextViewController.collegeName = "College Eight & Oakes"
        } else if(currentCell!.textLabel!.text == "College Nine & College Ten"){
            yourNextViewController.items = college9Items
            yourNextViewController.collegeName = "College Nine & College Ten"
        } else if(currentCell!.textLabel!.text == "Porter & Kresge"){
            yourNextViewController.items = collegePorterItems
            yourNextViewController.collegeName = "Porter & Kresge"
        } else if(currentCell!.textLabel!.text == "Cowell & Stevenson"){
            yourNextViewController.items = collegeCowellItems
            yourNextViewController.collegeName = "Cowell & Stevenson"
        } else if(currentCell!.textLabel!.text == "Crown & Merrill") {
            yourNextViewController.items = collegeCrownItems
            yourNextViewController.collegeName = "Crown & Merrill"
        }
        
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return diningHallNames.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let diningHall = diningHallNames[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("DiningTableCell", forIndexPath: indexPath) as UITableViewCell?
        
        cell!.textLabel!.text = diningHall

        
        return cell!
    }
    
    
}
