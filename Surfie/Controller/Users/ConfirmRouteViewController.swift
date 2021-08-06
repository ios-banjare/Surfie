//
//  ConfirmRouteViewController.swift
//  Surfie
//
//  Created by Apple on 28/07/21.
//

import UIKit
import GoogleMaps

class ConfirmRouteViewController: UIViewController, HeaderViewDelegate {

    //MARK: - [ IBOutlets ] -
    
    @IBOutlet weak var headerView : HeaderView!
    @IBOutlet weak var vwBottom : UIView!
    @IBOutlet weak var googleMap : GMSMapView!
    @IBOutlet weak var btnConfirm : UIButton!
    @IBOutlet weak var btnCall : UIButton!
    @IBOutlet weak var btnMessage : UIButton!
    @IBOutlet weak var vwRate : CosmosView!
    @IBOutlet weak var imgUser : UIImageView!

    //MARK: - [ UILabel Outlets ] -

    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var lblRating : UILabel!
    @IBOutlet weak var lblPriceValue : UILabel!
    @IBOutlet weak var lblPrice : UILabel!
    @IBOutlet weak var lblTime : UILabel!
    @IBOutlet weak var lblTimeValue : UILabel!
    @IBOutlet weak var lblDist : UILabel!
    @IBOutlet weak var lblDistValue : UILabel!

    //MARK: - [ Properties] -
    
    var selectedCategory:Int = 0
    
    //MARK: - [ ViewLifeCycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpOnLoad()
        self.setUpLocalizedText()
    }
    
    func setUpOnLoad() {
        headerView.lblTitle.isHidden = true
        headerView.delegate = self
        vwBottom.clipsToBounds = false
        vwBottom.layer.cornerRadius = 15
        vwBottom.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        //Google Map set Up
        let camera = GMSCameraPosition.camera(withLatitude: -33.86013352978327, longitude: 151.20291117578745, zoom: 16.0)
        googleMap.camera = camera
        
        let source = CLLocationCoordinate2D(latitude: -33.85876734454313, longitude: 151.20258193463087)
        let destination = CLLocationCoordinate2D(latitude: -33.862188473998245, longitude: 151.20388381183147)
       // self.getRouteSteps(from: source, to: destination)
        self.addMarker(at: source, and: destination)
    }
    
    func setUpLocalizedText() {
        btnConfirm.setTitle("CANCEL".local.uppercased(), for: .normal)
        lblPrice.text = "PRICE".local + StaticCharacter.Column
        lblTime.text = "TIME".local + StaticCharacter.Column
        lblDist.text = "DIST".local + StaticCharacter.Column
    }


    //MARK: - [ Selector Method ] -
    
    func leftBarButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func confirmButtonClicked(_ sender: UIButton) {
        if sender.titleLabel?.text == "CANCEL".local.uppercased() {
            btnConfirm.setTitle("CONFIRM".local.uppercased(), for: .normal)
            btnCall.isHidden = true
            btnMessage.isHidden = true
        } else {
            btnConfirm.setTitle("CANCEL".local.uppercased(), for: .normal)
            btnCall.isHidden = false
            btnMessage.isHidden = false
        }
    }
    
    @IBAction func callButtonClicked(_ sender: UIButton) {
        
    }
    
    @IBAction func messageButtonClicked(_ sender: UIButton) {
        
    }
    
}


extension ConfirmRouteViewController: GMSMapViewDelegate {
    
    func addMarker(at source: CLLocationCoordinate2D, and destination: CLLocationCoordinate2D) {
        
        let markerM = GMSMarker()
        markerM.map = self.googleMap
        markerM.position = source
        markerM.icon = UIImage(named: "boy")
        
//        let marker = GMSMarker()
//        marker.map = self.googleMap
//        marker.position = source
//        marker.icon = UIImage(named: "destination")
        
        let markerD = GMSMarker()
        markerD.map = self.googleMap
        markerD.position = destination
        markerD.icon = UIImage(named: "destination")
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
       // print("lat %@ & long  %@ --- ", coordinate.latitude, coordinate.longitude)
    }
    
    func getRouteSteps(from source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        guard let url = URL(string: "https://maps.googleapis.com/maps/api/directions/json?origin=\(source.latitude),\(source.longitude)&destination=\(destination.latitude),\(destination.longitude)&sensor=false&mode=driving&key=\("AIzaSyDT0ou5llt3O65LKFBZk-SddcxXK7BJjLw")") else {
            return
        }
        DispatchQueue.main.async {
            session.dataTask(with: url) { (data, response, error) in
                guard data != nil else {
                    return
                }
                do {
                    let route = try JSONDecoder().decode(MapPath.self, from: data!)
                    if let points = route.routes?.first?.overview_polyline?.points {
                        self.drawPath(with: points)
                    }
                    print(route.routes?.first?.overview_polyline?.points)
                } catch let error {
                    
                    print("Failed to draw ",error.localizedDescription)
                }
            }.resume()
        }
    }
    
    //MARK:- Draw polygon -
    private func drawPath(with points : String){
        DispatchQueue.main.async {
            
            let path = GMSPath(fromEncodedPath: points)
            let polyline = GMSPolyline(path: path)
            polyline.strokeWidth = 2.0
            polyline.strokeColor = AppColor.orangeColor ?? .red
            polyline.map = self.googleMap
            
        }
    }
}


private struct MapPath : Decodable{
    var routes : [Route]?
}

private struct Route : Decodable{
    var overview_polyline : OverView?
}

private struct OverView : Decodable {
    var points : String?
}


