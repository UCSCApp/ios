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

class MapViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Map"
        var camera = GMSCameraPosition.cameraWithLatitude(36.99578157522153,
            longitude: -122.058908423001, zoom: 14)
        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
        self.view = mapView
        
        var McHenrymarker = GMSMarker()
        McHenrymarker.position = CLLocationCoordinate2DMake(36.99578157522153, -122.058908423001)
        McHenrymarker.title = "McHenry Library"
        McHenrymarker.icon = UIImage(named: "library")
        McHenrymarker.snippet = "UCSC"
        McHenrymarker.map = mapView
        var SciEngmarker = GMSMarker()
        SciEngmarker.position = CLLocationCoordinate2DMake(36.99904411574191,-122.06070818525006)
        SciEngmarker.title = "S&E Library"
        SciEngmarker.icon = UIImage(named: "library")
        SciEngmarker.snippet = "UCSC"
        SciEngmarker.map = mapView
        var c8andOakesDiningHall = GMSMarker()
        c8andOakesDiningHall.snippet = "UCSC"
        c8andOakesDiningHall.position = CLLocationCoordinate2DMake(36.991655, -122.065103)
        c8andOakesDiningHall.title = "College 8 & Oakes Dining Hall"
        c8andOakesDiningHall.appearAnimation = kGMSMarkerAnimationPop
        c8andOakesDiningHall.icon = UIImage(named: "dining_hall")
        c8andOakesDiningHall.map = mapView
        var diningPorterKresge = GMSMarker()
        diningPorterKresge.position = CLLocationCoordinate2DMake(36.994341, -122.066066)
        diningPorterKresge.snippet = "UCSC"
        diningPorterKresge.title = "Porter & Kresge Dining Hall"
        diningPorterKresge.appearAnimation = kGMSMarkerAnimationPop
        diningPorterKresge.icon = UIImage(named: "dining_hall")
        diningPorterKresge.map = mapView
        var diningnineandten = GMSMarker()
        diningnineandten.position = CLLocationCoordinate2DMake(37.001096, -122.058031)
        diningnineandten.snippet = "UCSC"
        diningnineandten.title = "College Nine and Ten Dining Hall"
        diningnineandten.appearAnimation = kGMSMarkerAnimationPop
        diningnineandten.icon = UIImage(named: "dining_hall")
        diningnineandten.map = mapView
        var diningcrownandmerrill = GMSMarker()
        diningcrownandmerrill.position = CLLocationCoordinate2DMake(36.999971, -122.054448)
        diningcrownandmerrill.snippet = "UCSC"
        diningcrownandmerrill.title = "Crown and Merrill Dining Hall"
        diningcrownandmerrill.appearAnimation = kGMSMarkerAnimationPop
        diningcrownandmerrill.icon = UIImage(named: "dining_hall")
        diningcrownandmerrill.map = mapView
        var diningcowellandstevenson = GMSMarker()
        diningcowellandstevenson.position = CLLocationCoordinate2DMake(36.997157, -122.053150)
        diningcowellandstevenson.snippet = "UCSC"
        diningcowellandstevenson.title = "Cowell and Stevenson Dining Hall"
        diningcowellandstevenson.appearAnimation = kGMSMarkerAnimationPop
        diningcowellandstevenson.icon = UIImage(named: "dining_hall")
        diningcowellandstevenson.map = mapView
        
    }
}