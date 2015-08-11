//
//  MapViewController.swift
//  SlugRoute
//
//  Created by Karol josef Bustamante on 8/6/15.
//  Copyright (c) 2015 UCSC iOS. All rights reserved.
//

import Foundation
import UIKit

class MapViewController: UIViewController {
    

    @IBOutlet weak var copyright: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var camera = GMSCameraPosition.cameraWithLatitude(36.99578157522153,
            longitude: -122.058908423001, zoom: 14)
        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
        self.view = mapView
        
        var McHenrymarker = GMSMarker()
        McHenrymarker.position = CLLocationCoordinate2DMake(36.99578157522153, -122.058908423001)
        McHenrymarker.title = "McHenry Library"
        McHenrymarker.snippet = "UCSC"
        McHenrymarker.map = mapView
        var SciEngmarker = GMSMarker()
        SciEngmarker.position = CLLocationCoordinate2DMake(36.99904411574191,-122.06070818525006)
        SciEngmarker.title = "S&E Library"
        SciEngmarker.snippet = "UCSC"
        SciEngmarker.map = mapView
        copyright.text = GMSServices.openSourceLicenseInfo()
    }
}