/**
 This class contains all the colors used in this app
 */
import UIKit
import Foundation

struct AppColor {
    static let skyBlue = UIColor(named: "skyBlue")
    static let defaultBlack = UIColor(named: "black")
    static let defaultWhite = UIColor(named: "defaultWhite")
    
    static let errorColor = UIColor(named: "errorColor")
    static let primaryTextColor =  UIColor(named: "primaryTextColor")
    static let primaryThemeColor =  UIColor(named: "primaryThemeColor")
    static let secondaryTextColor =  UIColor(named: "secondaryTextColor")
    static let secondaryThemeColor =  UIColor(named: "secondaryThemeColor")
    static let lblColor = UIColor(named: "lblColor")
    static let themeGradientColor = UIColor(named: "themeGradientColor")
    static let appBtnBorderColor = UIColor(named: "appBtnBorderColor")?.cgColor
    static let appBtnShadowColor = UIColor(named: "appBtnShadowColor")?.cgColor
    static let appBackColor = UIColor(named: "appBackColor")
    static let textTitleColor = UIColor(named: "textTitleColor")
    static let defaultShaowColor = UIColor(named: "defaultShaowColor")
    static let appGreenColor = UIColor(named: "appGreenColor")
    
    static let orangeColor = UIColor(named: "orange")
}

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
