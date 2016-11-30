//
//  ViewController.swift
//  MapTileArtefactBugExample
//
//  Created by Josh Lay on 30/11/2016.
//  Copyright © 2016 Agworld. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.addOverlays(polygonOverlays())

        var mapRect = MKMapRectNull
        for overlay in mapView.overlays {
            mapRect = MKMapRectUnion(mapRect, overlay.boundingMapRect)
        }
        mapView.setVisibleMapRect(mapRect, animated: true)
    }

    private func polygonOverlays() -> [MKPolygon] {
        let coordinates1 = [CLLocationCoordinate2DMake(-31.945385, 115.8397), CLLocationCoordinate2DMake(-31.950584, 115.833622), CLLocationCoordinate2DMake(-31.953345, 115.842422), CLLocationCoordinate2DMake(-31.948626, 115.842118), CLLocationCoordinate2DMake(-31.947188, 115.841721)];
        let polygon1 = MKPolygon(coordinates: coordinates1, count: coordinates1.count)

        let coordinates2 = [CLLocationCoordinate2DMake(-31.951026, 115.833572), CLLocationCoordinate2DMake(-31.963841, 115.818793), CLLocationCoordinate2DMake(-31.973640, 115.818119), CLLocationCoordinate2DMake(-31.970784, 115.826877), CLLocationCoordinate2DMake(-31.971990, 115.828416), CLLocationCoordinate2DMake(-31.970404, 115.831919), CLLocationCoordinate2DMake(-31.961252, 115.839643), CLLocationCoordinate2DMake(-31.955895, 115.844020)]

        let polygon2 = MKPolygon(coordinates: coordinates2, count: coordinates2.count)

        return [polygon1, polygon2]
    }

    @IBAction func onZoomOut() {
        let mapRect = MKMapRectMake(220212004.83130437, 159122964.17118242, 751257.22739300132, 548769.911467731)
        mapView.setVisibleMapRect(mapRect, animated: true)
    }

    @IBAction func onZoomIn() {
        let mapRect = MKMapRectMake(220572028.24876511, 159395641.7497282, 12203.848172932863, 8914.5294544100761)
        mapView.setVisibleMapRect(mapRect, animated: true)
    }

    // MARK: MKMapViewDelegate
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolygonRenderer(overlay: overlay)
        renderer.lineWidth = 10
        renderer.strokeColor = UIColor.white
        renderer.fillColor = UIColor.lightGray

        return renderer
    }
}

