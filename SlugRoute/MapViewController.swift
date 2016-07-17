//
//  MapViewController.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 8/6/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, UIPopoverPresentationControllerDelegate {
    
    @IBAction func iconsToggle(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("iconsView", sender: self)
        
    }
    
    @IBOutlet weak var searchBar: UIBarButtonItem!
    
    var allFacilities : Dictionary<String,Array<Facility>> = [:]
    var loopBuses : [LoopBus] = []
    var loopBusesMarkers = [String:GMSMarker]()
    var invalidateTimer = false
    let locationManager = CLLocationManager()
    var checked : [Bool] = []
    var myLongitude = 0.0
    var myLatitude = 0.0
    var me = GMSMarker()
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "iconsView" {
            let vc = segue.destinationViewController as! IconsTableViewController
            let controller = vc.popoverPresentationController
            vc.allFacilities = self.allFacilities
            
            if self.checked.count == 0 {
                self.checked = [Bool](count: self.allFacilities.count, repeatedValue: false)
            }
            vc.checked = self.checked
            if controller != nil {
                controller!.delegate = self
            }
        } else if segue.identifier == "searchView" {
            let vc = segue.destinationViewController as! SearchTableViewController
            vc.allFacilities = self.allFacilities
            let controller = vc.popoverPresentationController
            if controller != nil {
                controller!.delegate = self
                
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        self.myLongitude = locValue.longitude
        self.myLatitude = locValue.latitude
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Map"
        let camera = GMSCameraPosition.cameraWithLatitude(36.99578157522153,
            longitude: -122.058908423001, zoom: 14)
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        
        mapView.myLocationEnabled = true
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }

        //set bus location refresh every 2 seconds
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(MapViewController.delayedFunctionWithoutParameter(_:)), userInfo: nil, repeats: true)

        
        self.view = mapView
        
        
        getFacilityLocations()
        
        let McHenrymarker = GMSMarker()
        McHenrymarker.position = CLLocationCoordinate2DMake(36.99578157522153, -122.058908423001)
        McHenrymarker.title = "McHenry Library"
        McHenrymarker.icon = UIImage(named: "library")
        McHenrymarker.snippet = "UCSC"
        McHenrymarker.map = mapView
        let SciEngmarker = GMSMarker()
        SciEngmarker.position = CLLocationCoordinate2DMake(36.99904411574191,-122.06070818525006)
        SciEngmarker.title = "S&E Library"
        SciEngmarker.icon = UIImage(named: "library")
        SciEngmarker.snippet = "UCSC"
        SciEngmarker.map = mapView
        let c8andOakesDiningHall = GMSMarker()
        c8andOakesDiningHall.snippet = "UCSC"
        c8andOakesDiningHall.position = CLLocationCoordinate2DMake(36.991655, -122.065103)
        c8andOakesDiningHall.title = "College 8 & Oakes Dining Hall"
        c8andOakesDiningHall.appearAnimation = kGMSMarkerAnimationPop
        c8andOakesDiningHall.icon = UIImage(named: "dining_hall")
        c8andOakesDiningHall.map = mapView
        let diningPorterKresge = GMSMarker()
        diningPorterKresge.position = CLLocationCoordinate2DMake(36.994341, -122.066066)
        diningPorterKresge.snippet = "UCSC"
        diningPorterKresge.title = "Porter & Kresge Dining Hall"
        diningPorterKresge.appearAnimation = kGMSMarkerAnimationPop
        diningPorterKresge.icon = UIImage(named: "dining_hall")
        diningPorterKresge.map = mapView
        let diningnineandten = GMSMarker()
        diningnineandten.position = CLLocationCoordinate2DMake(37.001096, -122.058031)
        diningnineandten.snippet = "UCSC"
        diningnineandten.title = "College Nine and Ten Dining Hall"
        diningnineandten.appearAnimation = kGMSMarkerAnimationPop
        diningnineandten.icon = UIImage(named: "dining_hall")
        diningnineandten.map = mapView
        let diningcrownandmerrill = GMSMarker()
        diningcrownandmerrill.position = CLLocationCoordinate2DMake(36.999971, -122.054448)
        diningcrownandmerrill.snippet = "UCSC"
        diningcrownandmerrill.title = "Crown and Merrill Dining Hall"
        diningcrownandmerrill.appearAnimation = kGMSMarkerAnimationPop
        diningcrownandmerrill.icon = UIImage(named: "dining_hall")
        diningcrownandmerrill.map = mapView
        let diningcowellandstevenson = GMSMarker()
        diningcowellandstevenson.position = CLLocationCoordinate2DMake(36.997157, -122.053150)
        diningcowellandstevenson.snippet = "UCSC"
        diningcowellandstevenson.title = "Cowell and Stevenson Dining Hall"
        diningcowellandstevenson.appearAnimation = kGMSMarkerAnimationPop
        diningcowellandstevenson.icon = UIImage(named: "dining_hall")
        diningcowellandstevenson.map = mapView

        getBusLocations()

        //setBusLocations
        for bus in loopBuses{
            let loopBus = GMSMarker()
            loopBus.position = CLLocationCoordinate2DMake(bus.lat, bus.lon)
            loopBus.snippet = "UCSC"
            loopBus.appearAnimation = kGMSMarkerAnimationPop
            loopBus.title = bus.type
            loopBus.icon = UIImage(named: "loop_bus.png")
            loopBus.map = mapView
            loopBusesMarkers[bus.id]=loopBus
    
        }
        
        //set my location
        let me = GMSMarker()
        me.position = CLLocationCoordinate2DMake(self.myLatitude, self.myLongitude)
        me.snippet = "UCSC"
        me.appearAnimation = kGMSMarkerAnimationPop
        me.title = "Me"
        me.icon = UIImage(named: "cafe.png")
        me.map = mapView
        self.me = me

    }

    
    func getBusLocations()
    {
        do {
            // do some task
            // http://bts.ucsc.edu:8081/location/get
            
            let request = NSURLRequest(URL: NSURL(string: "http://bts.ucsc.edu:8081/location/get")!)
            var response:NSURLResponse?
            let error:NSError? = nil
            var responseData = ""
            let dataGet = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
            if error == nil {
                responseData = String(data: dataGet, encoding: NSUTF8StringEncoding)!
                // Parse the data
            } else {
                // Handle error
            }
            
            // convert String to NSData
            let data: NSData = responseData.dataUsingEncoding(NSUTF8StringEncoding)!
            // convert 'AnyObject' to Array of maps
            let anyObj: AnyObject? = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            if let anyObj = anyObj {
                if let elems = anyObj as? [[String: AnyObject]] {
                    for bus in elems {
                        loopBuses.append(LoopBus(data: bus))
                    }
                }
            }
            
        } catch {
            print("json error: \(error)")
        }
    }
    
    func getFacilityLocations()
    {
        
        let request = NSURLRequest(URL: NSURL(string: "http://ec2-52-10-36-144.us-west-2.compute.amazonaws.com:8080/map")!)
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
        
        
        // convert String to NSData
        let data: NSData = responseData.dataUsingEncoding(NSUTF8StringEncoding)!
        
        
        do {
            // convert 'AnyObject' to Array<Business>
            let anyObj: AnyObject? = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            if let anyObj = anyObj {
                if let elems = anyObj as? Array<Dictionary<String,AnyObject>> {
                    for item in elems {
                        let aBuilding = Facility(data: item)
                        if allFacilities[aBuilding.type] == nil {
                            var newArrayOfFacilities : Array<Facility> = []
                            newArrayOfFacilities.append(aBuilding)
                            self.allFacilities[aBuilding.type] = newArrayOfFacilities
                        } else {
                            allFacilities[aBuilding.type]!.append(aBuilding)
                        }
   
                    }
                }
            }
        } catch {
            print("json error: \(error)")
        }
        
    }
    
    // SIMPLE TIMER - Delayed Function Call to update bus locations
    func delayedFunctionWithoutParameter(timer : NSTimer) {
        /*let priority = DISPATCH_QUEUE_PRIORITY_BACKGROUND
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            dispatch_async(dispatch_get_main_queue()) {

            }
            
        }*/
        do {
            self.loopBuses.removeAll()
            // do some task
            var responseData = ""
            let request = NSURLRequest(URL: NSURL(string: "http://bts.ucsc.edu:8081/location/get")!)
            let error:NSError? = nil
            var response:NSURLResponse?
            let getdata = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
            if (error == nil) {
                responseData = String(data: getdata, encoding: NSUTF8StringEncoding)!
                // Parse the data
            } else {
                // Handle error
            }
            
            // convert String to NSData
            let data: NSData = responseData.dataUsingEncoding(NSUTF8StringEncoding)!
            // convert 'AnyObject' to Array of maps
            let anyObj: AnyObject? = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            if let anyObj = anyObj {
                if let elems = anyObj as? [[String: AnyObject]] {
                    for bus in elems {
                        self.loopBuses.append(LoopBus(data: bus))
                    }
                }
            }
        } catch {
            print("json error: \(error)")
        }
        
        // update some UI
        for (key,val) in self.loopBusesMarkers{
            for bus in self.loopBuses {
                if(key == bus.id){
                    val.position = CLLocationCoordinate2DMake(bus.lat, bus.lon)

                }
            }
        }
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
        self.me.position = CLLocationCoordinate2DMake(self.myLatitude, self.myLongitude)
        if(invalidateTimer){
            timer.invalidate()
        }
    }

    

}