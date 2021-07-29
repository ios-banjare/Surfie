//
//  Common.swift
//  Surfie
//
//  Created by Mahadev on 25/06/21.
//  Copyright © 2021 Chauhan. All rights reserved.
//

import UIKit

class Common: NSObject {

    static let instance = Common()
    
    func clearLaunchScreenCache() {
        do {
            try FileManager.default.removeItem(atPath: NSHomeDirectory()+"/Library/SplashBoard")
        } catch {
            DPrint("Failed to delete launch screen cache: \(error)")
        }
    }

    
    
    //Get Controller
    func controller(_ storyboardId: String, for controller: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardId, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: controller)
    }
    
    func getCurrentDate() -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormats.format1.rawValue
        let myString = formatter.string(from: Date())
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = DateFormats.format7.rawValue
        let myStringafd = formatter.string(from: yourDate!)
        return myStringafd
    }
    
    //Get address from location
    func getAddressFrom(_ lat: Double, withLongitude lon: Double, completion: @escaping (_ addess: String?) -> ()) {
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = lat
        center.longitude = lon
        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
        ceo.reverseGeocodeLocation(loc, completionHandler:
            {(placemarks, error) in
                
                guard placemarks != nil else {
                    completion(nil)
                    return
                }
                let pm = placemarks! as [CLPlacemark]
                guard pm.count == 0 else {
                    let pm = placemarks![0]
                    var addressString : String = ""
                    if pm.subLocality != nil {
                        addressString = addressString + pm.subLocality! + ", "
                    }
                    if pm.thoroughfare != nil {
                        addressString = addressString + pm.thoroughfare! + ", "
                    }
                    if pm.locality != nil {
                        addressString = addressString + pm.locality! + ", "
                    }
                    if pm.country != nil {
                        addressString = addressString + pm.country! + ", "
                    }
                    if pm.postalCode != nil {
                        addressString = addressString + pm.postalCode! + " "
                    }
                    completion(addressString)
                    return
                }
                completion(nil)
        })
    }

    
    //To Get Images from server URL
    func getImageData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    //To Download Images from URL
    func downloadImage(from url: URL, imageView: UIImageView) {
        getImageData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                imageView.image = UIImage(data: data)
            }
        }
    }
    
    //MARK: - Date Picker Method -
    
    func setPlaceHolder(textField : UITextField, placeHolderVal : String){
           textField.attributedPlaceholder = NSAttributedString(string: placeHolderVal, attributes: [NSAttributedString.Key.foregroundColor: AppColor.primaryTextColor?.withAlphaComponent(0.64) ?? .white, NSAttributedString.Key.font : UIFont(name: FontNames.Regular, size: 14)!])
    }
    
    /**
     Call this function to show negative alert with callabck
     */
    func showNegativeAlert(_ title: String?, message: String?, cancelTitle: String, defaultTitle: String, acceptCallback: (()->())?, cancelCallback: (()->())?) {
        DispatchQueue.main.async {
            
            var customWindow = UIWindow()
            if #available(iOS 13.0, *) {
                let windowScene = UIApplication.shared
                    .connectedScenes
                    .filter { $0.activationState == .foregroundActive }
                    .first
                if let windowScene = windowScene as? UIWindowScene {
                    customWindow = UIWindow(windowScene: windowScene)
                }
            }
            customWindow.backgroundColor = .clear
            customWindow.rootViewController = UIViewController()
            customWindow.windowLevel = UIWindow.Level.alert + 1
            customWindow.makeKeyAndVisible()
            
            let alertController = UIAlertController(title: title, message:
                message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: cancelTitle, style: .default, handler: { (_) in
                customWindow.resignKey()
                if let callback = cancelCallback {
                    callback()
                }
            }))
            alertController.addAction(UIAlertAction(title: defaultTitle, style: .default, handler: { (_) in
                customWindow.resignKey()
                if let callback = acceptCallback {
                    callback()
                }
            }))
            customWindow.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
    
    
    func showeAlert(_ title: String?, message: String?, acceptCallback: (()->())?) {
        DispatchQueue.main.async {
            var customWindow = UIWindow()
            if #available(iOS 13.0, *) {
                let windowScene = UIApplication.shared
                    .connectedScenes
                    .filter { $0.activationState == .foregroundActive }
                    .first
                if let windowScene = windowScene as? UIWindowScene {
                    customWindow = UIWindow(windowScene: windowScene)
                }
            }
            customWindow.backgroundColor = .clear
            customWindow.rootViewController = UIViewController()
            customWindow.windowLevel = UIWindow.Level.alert + 1
            customWindow.makeKeyAndVisible()
            
            let alertController = UIAlertController(title: title, message:
                message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "LocalizedText.OK", style: .default, handler: { (_) in
                customWindow.resignKey()
                if let callback = acceptCallback {
                    callback()
                }
            }))
            customWindow.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }

    func randomString(length: Int) -> String {
        let letters = StaticText.randomNumberGenerator
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func rootToSideMenu(controllerBy strId: String, andByStorybord name: String)  {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: strId)
        
        let storyboardSideMenu = UIStoryboard(name: StoryboardNames.Main.rawValue, bundle: nil)
        guard let leftViewController = storyboardSideMenu.instantiateViewController(withIdentifier: StoryboardIds.Menu) as? MenuViewController else {
            return
        }
        let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
        nvc.isNavigationBarHidden = true
        let nvcLeft: UINavigationController = UINavigationController(rootViewController: leftViewController)
        nvcLeft.isNavigationBarHidden = true
        let slideMenuController = SlideMenuController(mainViewController: nvc, leftMenuViewController: nvcLeft)
        slideMenuController.delegate = mainViewController as? SlideMenuControllerDelegate
        UIApplication.window().rootViewController = slideMenuController
        UIApplication.window().makeKeyAndVisible()
    }
    
    
    func rootTo(controllerBy strId: String, andByStorybord name: String)  {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: strId)
        let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
        nvc.isNavigationBarHidden = true
        UIApplication.window().rootViewController = nvc
        UIApplication.window().makeKeyAndVisible()
    }
    
    func getSalutaionWish() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 6..<12 : return "GD_MORN".local
        case 12 : return "GD_NOON".local
        case 13..<17 : return "GD_AFTERNOON".local
        case 17..<22 : return "GD_EVE".local
        default: return "GD_NIGHT".local
        }
    }
   
}
