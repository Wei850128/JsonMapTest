//
//  ShowDetailViewController.swift
//  JsonTest
//
//  Created by 劉家瑋 on 2020/8/19.
//  Copyright © 2020 劉家瑋. All rights reserved.
//

import UIKit
import MapKit
class ShowDetailViewController: UIViewController {
    
    var location:CLLocationCoordinate2D!
    var latitude=0.0
    var longitude=0.0
    var data:Coffee?
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        
    }
    
    func initData() {
        name.text = data?.name
        address.text = data?.address
        
        if let data = data {
            latitude = Double(data.latitude)!
            longitude = Double(data.longitude)!
        }
        
        location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)//座標

        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)//放大比例
        let region:MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)
        map.mapType = .standard
           
        let annotation = MKPointAnnotation()
        annotation.coordinate = location //大頭針的座標
        annotation.title = data?.name
        annotation.subtitle = data?.address
        map.addAnnotation(annotation)
        
    }
}
