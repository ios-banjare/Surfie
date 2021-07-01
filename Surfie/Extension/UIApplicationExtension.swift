//
//  UIApplicationExtension.swift
//  Surfie
//
//  Created by Ankush Mahajan on 28/06/21.
//

import Foundation

extension UIApplication {
    
    class func getTopMostViewController(base: UIViewController? = UIApplication.window().rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getTopMostViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return getTopMostViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return getTopMostViewController(base: presented)
        }
        return base
    }
    
    class func window() -> UIWindow {
        
        var window: UIWindow?
        
        if #available(iOS 13.0, *) {
            window = UIApplication.shared.windows.first
        } else {
            window = UIApplication.shared.keyWindow
        }
        
        return window ?? UIWindow()
    }
    
    func clearLaunchScreenCache() {
        do {
            let launchScreenPath = "\(NSHomeDirectory())/Library/SplashBoard"
            try FileManager.default.removeItem(atPath: launchScreenPath)
        } catch {
            DPrint("Failed to delete launch screen cache: \(error)")
        }
    }
}




