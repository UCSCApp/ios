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
    var facilities : [Facility] = []
    var loopBuses : [LoopBus] = []
    var loopBusesMarkers = [String:GMSMarker]()
    var facilitiesMarkers = [String:GMSMarker]()
    var invalidateTimer = false
    let locationManager = CLLocationManager()
    var checked : [Bool] = []
    var myLongitude = 0.0
    var myLatitude = 0.0
    var me = GMSMarker()
    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "iconsView" {
            let vc = segue.destinationViewController as! IconsTableViewController
            let controller = vc.popoverPresentationController
            vc.allFacilities = self.allFacilities
            
            if self.checked.count == 0 {
                self.checked = [Bool](count: self.allFacilities.count, repeatedValue: false)
            }
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
    
    /*
     * @FUNC that gets devices longitude and latitude
    */
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        self.myLongitude = locValue.longitude
        self.myLatitude = locValue.latitude
        //print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    func updateFacilitiesInMapFromSharedPreferences(mapView : GMSMapView) {
        for (_,val) in self.facilitiesMarkers {
            let theChecked = userDefaults.objectForKey(val.snippet) as! Int
            if theChecked == 0 {
                val.map = nil
            } else {
                val.map = mapView
            }
        }
    }
    
    func popoverPresentationControllerDidDismissPopover(popoverPresentationController: UIPopoverPresentationController) {
        
        let controller = popoverPresentationController.presentedViewController as! IconsTableViewController
        self.userDefaults = controller.userDefaults
        let mapView = controller.mapView
        self.view = mapView
        
        //non shared preferences way (passing data between VC
        /*
        let checkedMarks = controller.checked
        for (key,val) in self.facilitiesMarkers {
            print("key: " + key + " | values: " + val.snippet)
            if (checkedMarks.indexOf(val.snippet) == nil) {
                print("not checked")
                self.facilitiesMarkers[key]?.map = nil
            } else {
                print("checked")
                self.facilitiesMarkers[key]?.map = mapView
            }
        }
        */
        
        //shared preferences way
        updateFacilitiesInMapFromSharedPreferences(mapView)
        
        // Fetch data from the presented controller
        
        
    }
    
    func setBusLocations (mapView : GMSMapView){
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
    }
    
    func setMyLocation(mapView : GMSMapView) {
        //set my location
        let me = GMSMarker()
        me.position = CLLocationCoordinate2DMake(self.myLatitude, self.myLongitude)
        me.snippet = "UCSC"
        me.appearAnimation = kGMSMarkerAnimationPop
        me.title = "Me"
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
    
    func setFacilityLocations(mapView: GMSMapView) {
        for aFacility in self.facilities {
            
            let aMarkerForNewFacility = GMSMarker()
            aMarkerForNewFacility.position = CLLocationCoordinate2DMake(Double(aFacility.latitude)!, Double(aFacility.longitude)!)
            aMarkerForNewFacility.title = aFacility.name
            aMarkerForNewFacility.appearAnimation = kGMSMarkerAnimationPop
            if (aFacility.type == "library") {
                aMarkerForNewFacility.icon = UIImage(named: "library")
                aMarkerForNewFacility.snippet = "library"
                
            } else if (aFacility.type == "diningHall") {
                aMarkerForNewFacility.icon = UIImage(named: "dining_hall")
                aMarkerForNewFacility.snippet = "diningHall"
            } else if (aFacility.type == "cafe") {
                aMarkerForNewFacility.icon = UIImage(named: "cafe")
                aMarkerForNewFacility.snippet = "cafe"
            }
            aMarkerForNewFacility.map = mapView
            self.facilitiesMarkers[aFacility.name]=aMarkerForNewFacility
        }
    }
    
    func getFacilityLocations()
    {
        //HTTP request GET for all the location data for each facility
        let request = NSMutableURLRequest()
        request.URL = NSURL(string: "http://www.triton.cloud:8081/map/getLocations")!
        //request.HTTPMethod = "GET"
        request.setValue("8e942960-1c0b-48be-a4cc-c50582f142d3", forHTTPHeaderField: "X-Triton-App")
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
                print("synchronous request error: \(error)")
            }
            
        } catch {
            print("json error: \(error)")
        }
        
        
        // convert String to NSData
        let data: NSData = responseData.dataUsingEncoding(NSUTF8StringEncoding)!
        
        
        
        do {
            let anyObj: AnyObject? = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            if let anyObj = anyObj {
                if let elems = anyObj as? Array<Dictionary<String,AnyObject>> {
                    for item in elems {
                        let aFacility = Facility(data: item)
                        
                        if allFacilities[aFacility.type] == nil {
                            var newArrayOfFacilities : Array<Facility> = []
                            newArrayOfFacilities.append(aFacility)
                            self.allFacilities[aFacility.type] = newArrayOfFacilities
                        } else {
                            allFacilities[aFacility.type]!.append(aFacility)
                        }
                        self.facilities.append(aFacility)

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
        getBusLocations()
        
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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Map"
        let camera = GMSCameraPosition.cameraWithLatitude(36.99578157522153, longitude:
            -122.058908423001, zoom: 14)
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
        
        setFacilityLocations(mapView)
        
        getBusLocations()
        
        setBusLocations(mapView)
        
        setMyLocation(mapView)
        
        //shared preferences way
        updateFacilitiesInMapFromSharedPreferences(mapView)
 
    }

}