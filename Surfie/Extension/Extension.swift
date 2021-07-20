//
//  extension.swift
//  Surfie
//
//  Created by Mahadev on 25/06/21.
//  Copyright © 2021 Chauhan. All rights reserved.

import Foundation
import UIKit

extension UITextField {
    
    func text_Trimmed() -> String {
        if let actualText = self.text {
            return actualText.trimmingCharacters(in: .whitespaces)
        } else {
            return StaticText.EmptyText
        }
    }
}

//MARK: - Button Extension -

@IBDesignable extension UIButton {
	func underlineText() {
		guard let title = title(for: .normal) else { return }
		
		let titleString = NSMutableAttributedString(string: title)
		titleString.addAttribute(
			.underlineStyle,
			value: NSUnderlineStyle.single.rawValue,
			range: NSRange(location: 0, length: title.count)
		)
		titleString.addAttribute(
			.foregroundColor,
			value: self.titleLabel!.textColor!,
			range: NSRange(location: 0, length: title.count))
		setAttributedTitle(titleString, for: .normal)
	}
    
    func defaultAttributedText(spacing: CGFloat = 1.5, kern: CGFloat = 1)  {
        guard let textLayer = self.titleLabel else {
            return
        }
        textLayer.lineBreakMode = .byWordWrapping
        textLayer.numberOfLines = 0
        textLayer.textAlignment = .center
        let fontSize = textLayer.font.pointSize
        let fontName = textLayer.font.fontName
        let textContent = textLayer.text ?? StaticText.EmptyText
        let textString = NSMutableAttributedString(string: textContent, attributes: [
            NSAttributedString.Key.font: UIFont(name: fontName, size: fontSize)!
        ])
        let textRange = NSRange(location: 0, length: textString.length)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        paragraphStyle.alignment = textLayer.textAlignment
        textString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: textRange)
        textString.addAttribute(NSAttributedString.Key.kern, value: kern, range: textRange)
        textLayer.attributedText = textString
        textLayer.sizeToFit()
    }
    
}



//MARK: - UIView Extension -

@IBDesignable extension UIView {

    @IBInspectable
    var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable
    var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }

    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {

            layer.shadowRadius = newValue
        }
    }
    @IBInspectable
    var shadowOffset : CGSize{

        get{
            return layer.shadowOffset
        }set{

            layer.shadowOffset = newValue
        }
    }

    @IBInspectable
    var shadowColor : UIColor{
        get{
            return UIColor.init(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    @IBInspectable
    var shadowOpacity : Float {

        get{
            return layer.shadowOpacity
        }
        set {

            layer.shadowOpacity = newValue

        }
    }
    
    @discardableResult
    func applyGradient(colours: [CGColor], locations: [NSNumber]?, start: CGPoint?, end: CGPoint?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours
        gradient.locations = locations
        gradient.startPoint = start ?? CGPoint(x: 0.5, y: 0)
        gradient.endPoint = end ?? CGPoint(x: 0.5, y: 0.88)
        gradient.cornerRadius = self.layer.cornerRadius
        self.layer.addSublayer(gradient)
        return gradient
    }

    func shadowBorder() {
        layer.borderColor = AppColor.appBtnBorderColor
        layer.shadowColor = AppColor.appBtnShadowColor
        backgroundColor = AppColor.appBackColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 1.0
        layer.borderWidth = 1.0
        layer.masksToBounds = false
        layer.cornerRadius = 8.0
    }
    func shadowBorderwithmoreradious() {
        layer.borderColor = AppColor.appBtnBorderColor
        layer.shadowColor = AppColor.appBtnShadowColor
        backgroundColor = AppColor.appBackColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 5.0
        layer.shadowRadius = 5.0
        layer.borderWidth = 1.0
        layer.masksToBounds = false
        layer.cornerRadius = 8.0
    }

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: frame, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }

    var isRightToLeftUI: Bool {
        get {
            return Self.userInterfaceLayoutDirection(for: semanticContentAttribute) == .rightToLeft
        }
    }

    func rotateBy180Degrees() {
        transform = CGAffineTransform(rotationAngle: .pi)
    }
    
    var safeAreaBottom: CGFloat {
         if #available(iOS 11, *) {
            if let window = UIApplication.shared.keyWindowInConnectedScenes {
                return window.safeAreaInsets.bottom
            }
         }
         return 0
    }

    var safeAreaTop: CGFloat {
         if #available(iOS 11, *) {
            if let window = UIApplication.shared.keyWindowInConnectedScenes {
                return window.safeAreaInsets.top
            }
         }
         return 0
    }
}


//MARK: - String Extension -

extension String {
    
    func removingLeadingSpaces() -> String {
        guard let index = firstIndex(where: { !CharacterSet(charactersIn: String($0)).isSubset(of: .whitespaces) }) else {
            return self
        }
        return String(self[index...])
    }
    
    init(withInt int: Int, leadingZeros: Int = 2) {
        self.init(format: "%0\(leadingZeros)d", int)
    }
    
    func leadingZeros(_ zeros: Int) -> String {
        if let int = Int(self) {
            return String(withInt: int, leadingZeros: zeros)
        }
        return StaticText.EmptyText
    }
    
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    /// Retunrs true when sender does have only whitespaces or new lines
    /// Returns true if the sender is Equal to NA
    var isNAOrEmpty: Bool {
        if trimmingCharacters(in: .whitespacesAndNewlines).count == 0 || self == StaticText.NotApplicable {
            return true
        }
        return false
    }
    
    static func isNAOrEmpty(string: String?) -> Bool {
        if let sender = string {
            return sender.isNAOrEmpty
        }
        return true
    }
    
    public var local:String {
        return NSLocalizedString(self, comment: StaticText.EmptyText)
    }
    
    func convertDateString(_ fromFormat: DateFormats, toFormat: DateFormats) -> String {
        let date = self.getDate(fromFormat)
        return date.getString(toFormat)
    }
    
    func getDate(_ fromFormat: DateFormats) -> Date {
        
        let formatter = DateFormatter()
        formatter.dateFormat = fromFormat.rawValue
        formatter.locale = Locale(identifier: AppLocale.English)
        guard let yourDate = formatter.date(from: self) else {
            return Date()
        }
        return yourDate
    }
    
    func getUTCDate(_ fromFormat: DateFormats) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = fromFormat.rawValue
        formatter.locale = Locale(identifier: AppLocale.English)
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        guard let yourDate = formatter.date(from: self) else {
            return Date()
        }
        return yourDate
    }
    
    func toBase64() -> String {
        guard let data = self.data(using: String.Encoding.utf8) else {
            return StaticText.EmptyText
        }
        let base64 = data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
        return base64
    }
    
    func getCountryCodeByName() -> String {
        let locales : String = ""
        for localeCode in NSLocale.isoCountryCodes {
            let identifier = NSLocale(localeIdentifier: localeCode)
            let countryName = identifier.displayName(forKey: NSLocale.Key.countryCode, value: localeCode)
            if self.lowercased() == countryName?.lowercased() {
                return localeCode
            }
        }
        return locales
    }
    
    func utcToLocal(_ fromFormat: DateFormats, toFormat: DateFormats) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat.rawValue
        dateFormatter.locale = Locale(identifier: AppLocale.English)
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        if let date = dateFormatter.date(from: self) {
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.locale = Locale(identifier: AppLocale.English)
            dateFormatter.dateFormat = toFormat.rawValue
            return dateFormatter.string(from: date)
        }
        return StaticText.EmptyText
    }
    
    func localToUTC(_ fromFormat: DateFormats, toFormat: DateFormats) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat.rawValue
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale(identifier: AppLocale.English)
        if let date = dateFormatter.date(from: self) {
            dateFormatter.locale = Locale(identifier: AppLocale.English)
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            dateFormatter.dateFormat = toFormat.rawValue
            return dateFormatter.string(from: date)
        }
        return StaticText.EmptyText
    }
    
    /// Returns a string with all non-numeric characters removed
    public var numericString: String {
        let characterSet = CharacterSet(charactersIn: "0123456789.").inverted
        return components(separatedBy: characterSet)
            .joined()
    }
    
    func setTimestamp() -> String {
        let currentDate = Date()
        let epochDate = Date(timeIntervalSince1970: TimeInterval(self)!)
        let calendar = Calendar.current
        let currentDay = calendar.component(.day, from: currentDate)
        let currentHour = calendar.component(.hour, from: currentDate)
        let currentMinutes = calendar.component(.minute, from: currentDate)
        let currentSeconds = calendar.component(.second, from: currentDate)
        
        let epochDay = calendar.component(.day, from: epochDate)
        let epochMonth = calendar.component(.month, from: epochDate)
        let epochYear = calendar.component(.year, from: epochDate)
        let epochHour = calendar.component(.hour, from: epochDate)
        let epochMinutes = calendar.component(.minute, from: epochDate)
        let epochSeconds = calendar.component(.second, from: epochDate)
        
        if (currentDay - epochDay < 30) {
            if (currentDay == epochDay) {
                if (currentHour - epochHour == 0) {
                    if (currentMinutes - epochMinutes == 0) {
                        if (currentSeconds - epochSeconds <= 1) {
                            return String(currentSeconds - epochSeconds) + LocalizedText.SecondAgo
                        } else {
                            return String(currentSeconds - epochSeconds) + LocalizedText.SecondAgo
                        }
                        
                    } else if (currentMinutes - epochMinutes <= 1) {
                        return String(currentMinutes - epochMinutes) + LocalizedText.MinuteAgo
                    } else {
                        return String(currentMinutes - epochMinutes) + LocalizedText.MinuteAgo
                    }
                } else if (currentHour - epochHour <= 1) {
                    return String(currentHour - epochHour) + LocalizedText.HourAgo
                } else {
                    return String(currentHour - epochHour) + LocalizedText.HourAgo
                }
            } else if (currentDay - epochDay <= 1) {
                return String(currentDay - epochDay) + LocalizedText.dayAgo
            } else {
                return String(currentDay - epochDay) + LocalizedText.dayAgo
            }
        } else {
            return String(epochDay) + LocalizedText.Space + getMonthNameFromInt(month: epochMonth) + LocalizedText.Space + String(epochYear)
        }
    }
    
    func getMonthNameFromInt(month: Int) -> String {
        switch month {
        case 1:
            return LocalizedText.Jan
        case 2:
            return LocalizedText.Feb
        case 3:
            return LocalizedText.Mar
        case 4:
            return LocalizedText.Apr
        case 5:
            return LocalizedText.May
        case 6:
            return LocalizedText.Jun
        case 7:
            return LocalizedText.Jul
        case 8:
            return LocalizedText.Aug
        case 9:
            return LocalizedText.Sept
        case 10:
            return LocalizedText.Oct
        case 11:
            return LocalizedText.Nov
        case 12:
            return LocalizedText.Dec
        default:
            return StaticText.EmptyText
        }
    }
    
    // NOTE: REPLACE ONLY 1ST OCCURANCE OF SUBSTRING
    func replacingFirstOccurrence(of target: String, with replacement: String) -> String {
        guard let range = self.range(of: target) else { return self }
        return self.replacingCharacters(in: range, with: replacement)
    }
    
    
    //Hide Middle Character
    func hideMidChars() -> String {
        return String(self.enumerated().map { index, char in
            return [0,  self.count - 1].contains(index) ? char : Character(StaticCharacter.Star)
        })
    }
    
    func hideCharsWithFixLength() -> String {
        var str = (String(self.enumerated().map { index, char in
                            print(char)
                            return [0,  self.count - 1].contains(index) ? char : Character(StaticCharacter.Star)}).replacingOccurrences(of:StaticCharacter.Star , with: StaticText.EmptyText))
        str.insert(contentsOf: StaticCharacter.SecureStar, at: str.index(after: str.startIndex))
        return str
    }
    
    
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
}


//MARK: - UILabel Extension -

extension NSMutableAttributedString {
    var fontSize:CGFloat { return 12 }
    var boldFont:UIFont { return UIFont(name: FontNames.Bold, size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize) }
    var regularFont:UIFont { return UIFont(name: FontNames.Regular, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)}
    var mediumFont:UIFont { return UIFont(name: FontNames.Medium, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)}

    func bold(_ value:String) -> NSMutableAttributedString {

        let attributes:[NSAttributedString.Key : Any] = [
            .font : boldFont
        ]

        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }

    func regular(_ value:String) -> NSMutableAttributedString {

        let attributes:[NSAttributedString.Key : Any] = [
            .font : regularFont,
        ]

        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func medium(_ value:String) -> NSMutableAttributedString {

        let attributes:[NSAttributedString.Key : Any] = [
            .font : mediumFont,
        ]

        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
}

@IBDesignable extension UILabel {
    
    func underlineText() {
        guard let title = self.text else { return }
        
        let titleString = NSMutableAttributedString(string: title)
        titleString.addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: title.count)
        )
        titleString.addAttribute(
            .foregroundColor,
            value: self.textColor!,
            range: NSRange(location: 0, length: title.count))
        self.attributedText = titleString
    }
    
    func defaultAttributedText(spacing: CGFloat = 1.71, kern: CGFloat = 0) {
        guard let title = self.text else { return }
        let fontSize = self.font.pointSize
        let fontName = self.font.fontName
        let textContent = title
        let textString = NSMutableAttributedString(string: textContent, attributes: [
            NSAttributedString.Key.font: UIFont(name: fontName, size: fontSize)!
        ])
        let textRange = NSRange(location: 0, length: textString.length)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        paragraphStyle.alignment = self.textAlignment
        textString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: textRange)
        textString.addAttribute(NSAttributedString.Key.kern, value: kern, range: textRange)
        self.attributedText = textString
    }
}


//MARK: - UIPageController Extension -

extension UIPageControl {

    func customPageControl(dotFillColor:UIColor, dotBorderColor:UIColor, dotBorderWidth:CGFloat) {
        for (pageIndex, dotView) in self.subviews.enumerated() {
             if self.currentPage == pageIndex {
                dotView.backgroundColor = dotFillColor
                dotView.layer.cornerRadius = dotView.frame.size.height / 2
            }else{
                dotView.backgroundColor = .clear
                dotView.layer.cornerRadius = dotView.frame.size.height / 2
                dotView.layer.borderColor = dotBorderColor.cgColor
                dotView.layer.borderWidth = dotBorderWidth
            }
        }
    }
}

//MARK: - UIViewController Extension -
extension UIViewController {

    /// Shows alert contorller with actions
    ///
    /// - Parameter title: Tiltle string
    /// - Parameter messgae: Message string
    /// - Parameter actions: actions as UIAlertActions
    /// - Parameter completion: callBack closure after controller is presented
    /// - Returns alert controller object that this API presented on screen
    @discardableResult func showAlert(withTitle title: String?, withMessage message: String?, withActions actions: [UIAlertAction], completion: (() -> Void)?) -> UIAlertController {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { (action) in
            controller.addAction(action)
        }
        // Show alert
        present(controller, animated: true, completion: completion)
        return controller
    }
    
    /// Adds child view controller to the parent.
    ///
    /// - Parameter child: Child view controller.
    func add(_ child: UIViewController, with animation: Bool = true) {
        addChild(child)
        if animation {
            UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.view.addSubview(child.view)
            }) { (done) in
                if done {
                    child.didMove(toParent: self)
                }
            }
        } else {
            self.view.addSubview(child.view)
            child.didMove(toParent: self)
        }
        
    }

    /// It removes the child view controller from the parent.
    func remove() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        removeFromParent()
        UIView.transition(with: view, duration: 1, options: .transitionCrossDissolve, animations: {
            self.view.removeFromSuperview()
        }, completion: nil)
        
    }
    
    static func topMostViewController() -> UIViewController? {
        if #available(iOS 13.0, *) {
            let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            return keyWindow?.rootViewController?.topMostViewController()
        }
        
        return UIApplication.shared.keyWindow?.rootViewController?.topMostViewController()
    }
    
    func topMostViewController() -> UIViewController? {
        if let navigationController = self as? UINavigationController {
            return navigationController.topViewController?.topMostViewController()
        }
        else if let tabBarController = self as? UITabBarController {
            if let selectedViewController = tabBarController.selectedViewController {
                return selectedViewController.topMostViewController()
            }
            return tabBarController.topMostViewController()
        }
        
        else if let presentedViewController = self.presentedViewController {
            return presentedViewController.topMostViewController()
        }
        
        else {
            return self
        }
    }
    
    @discardableResult func showAlertWithOkButton(title: String? = nil) -> UIAlertController {
        return showAlert(withTitle: title, withMessage: nil, withActions: [UIAlertAction(title: StaticText.OK, style: .default, handler: nil)], completion: nil)
    }
}

//MARK: - Layer Extension -

extension CALayer {
    
    func applySketchShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 8,
        spread: CGFloat = 0)
    {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        guard spread == 0 else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
            return
        }
        shadowPath = nil
    }
}


//MARK: - Date Extension -

extension Date {
    
    var time: TimeComponent {
        return TimeComponent(self)
    }
    
    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds))
    }
    
    func daysBetweenDate(_ toDate: Date) -> Int {
        let components = Calendar.current.dateComponents([.day], from: self, to: toDate)
        return components.day ?? 0
    }
    
    func getTimeStamp() -> Int64 {
        return Int64(self.timeIntervalSince1970)
    }
    
    func getTimeMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
    
    func gettimeStampStringFromEpoc() -> String {
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.maximumUnitCount = 1
        formatter.allowedUnits = [.year, .month, .day, .hour, .minute, .second]
        
        guard let timeString = formatter.string(from: self, to: Date()) else {
            return StaticText.EmptyText
        }
        
        let formatString = NSLocalizedString("%@ ago", comment: StaticText.EmptyText)
        return String(format: formatString, timeString)
        
    }
    
    func getString(_ toFormat: DateFormats) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = toFormat.rawValue
        formatter.locale = Locale(identifier: AppLocale.English)
        let toString = formatter.string(from: self)
        return toString
    }
    
    func getServerString(_ toFormat: DateFormats) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = toFormat.rawValue
        formatter.locale = Locale(identifier: AppLocale.English)
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let toString = formatter.string(from: self)
        return toString
    }
    
    func getDateString(_ fromFormat: DateFormats, to format: DateFormats) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = fromFormat.rawValue
        formatter.locale = Locale(identifier: AppLocale.English)
        let fromString = formatter.string(from: self)
        guard let yourDate = formatter.date(from: fromString) else {
            return StaticText.EmptyText
        }
        formatter.dateFormat = format.rawValue
        let toString = formatter.string(from: yourDate)
        return toString
    }
    
    
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return ""
    }
    
    func getWeakDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: AppLocale.English)
        let dayInWeek = dateFormatter.string(from: self)
        return dayInWeek
    }
    
}


//MARK: - Float -

extension Float {
    var roundToZero: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

//MARK: - Integer -

extension Int {
    
    var boolValue: Bool { return self != 0 }
    
    func convertToBase64() -> String {
        let longstring = "\(self)"
        guard let data = (longstring).data(using: String.Encoding.utf8) else {
            return StaticText.EmptyText
        }
        let base64 = data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
        return base64
    }
    
    var getDate : Date {
        return Date(milliseconds: Int64(self))
    }
    
     static func parse(from string: String) -> Int? {
        return Int(string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())
    }

}

//MARK: - Navigation Controller -

extension UINavigationController: UIGestureRecognizerDelegate {

    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard viewControllers.count > 1 else {
            return false
        }
        return (viewControllers.last?.children.last) == nil
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

extension Data {
    
    init<T>(from value: T) {
        var value = value
        self.init(buffer: UnsafeBufferPointer(start: &value, count: 1))
    }
    
    func to<T>(type: T.Type) -> T {
        return self.withUnsafeBytes { $0.load(as: T.self) }
    }
    
    var htmlToAttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            DPrint("error in converting htmlToString:", error)
            return  nil
        }
    }
    var htmlToString: String { htmlToAttributedString?.string ?? StaticText.EmptyText }
}

extension Bool {
    
    var intValue: Int {
        return self ? 1 : 0
    }
}

//MARK: - Scroll View  -

extension UIScrollView {

    // Scroll to a specific view so that it's top is at the top our scrollview
    func scrollToView(view:UIView, animated: Bool) {
        if let origin = view.superview {
            // Get the Y position of your child view
            let childStartPoint = origin.convert(view.frame.origin, to: self)
            // Scroll to a rectangle starting at the Y of your subview, with a height of the scrollview
            self.scrollRectToVisible(CGRect(x:0, y:childStartPoint.y,width: 1,height: self.frame.height), animated: animated)
        }
    }

    // Bonus: Scroll to top
    func scrollToTop(animated: Bool) {
        let topOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(topOffset, animated: animated)
    }

    // Bonus: Scroll to bottom
    func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
        if(bottomOffset.y > 0) {
            setContentOffset(bottomOffset, animated: true)
        }
    }

}

//MARK: - Table View  -

extension UITableView {
// It will show message on Empty TableView when data is not available
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = AppColor.primaryTextColor
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: FontNames.Regular, size: 16)
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .none
    }
}

extension FileManager {
    func documentDirectoryPath() throws -> String? {
        var docDir: String?
        do {
            let documentsURL = try
                FileManager.default.url(for: .documentDirectory,
                                        in: .userDomainMask,
                                        appropriateFor: nil,
                                        create: false)
            docDir = documentsURL.path
        } catch {
            DPrint("could not get docDirPath due to FileManager error: \(error)")
        }
        return docDir
    }
    
    func documentDirectoryURL() throws -> URL {
        var documentDirURL: URL
        
        do {
            documentDirURL = try
                FileManager.default.url(for: .documentDirectory,
                                        in: .userDomainMask,
                                        appropriateFor: nil,
                                        create: false)
        } catch {
            DPrint("could not get docDirURL due to FileManager error: \(error)")
            throw error
        }
        
        return documentDirURL
    }
    
    func systemCacheDirectoryURL() throws -> URL {
        let cacheDir = try FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return cacheDir
    }
}

extension StringProtocol {
    var htmlToAttributedString: NSAttributedString? {
        Data(utf8).htmlToAttributedString
    }
    var htmlToString: String {
        htmlToAttributedString?.string ?? StaticText.EmptyText
    }
}


extension UIImage {
    
    func rotate(radians: Float) -> UIImage {
        
        var newSize = CGRect(origin: CGPoint.zero, size: self.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
        // Trim off the extremely small float value to prevent core graphics from rounding it up
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!
        
        // Move origin to middle
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        // Rotate around middle
        context.rotate(by: CGFloat(radians))
        // Draw the image at its center
        self.draw(in: CGRect(x: -self.size.width/2, y: -self.size.height/2, width: self.size.width, height: self.size.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    //creates a UIImage given a UIColor
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}

extension URL {
    var typeIdentifier: String? {
        return (try? resourceValues(forKeys: [.typeIdentifierKey]))?.typeIdentifier
    }
    var localizedName: String? {
        return (try? resourceValues(forKeys: [.localizedNameKey]))?.localizedName
    }
}

//MARK: - AlertController  -
extension UIAlertController{
//    func adoptAppTheme(){
//        if #available(iOS 13.0, *) {
//            let theme = DarkmodeHandler.instance.fetchCurrentAppTheme()
//            if theme != .Auto{
//                self.overrideUserInterfaceStyle = theme == .Dark ? .dark : .light
//            }
//        } else {
//            // Before iOS 13 we don't support multiple themes for now.
//        }
//    }
}

extension Encodable {

    /// Converting object to postable dictionary
    func toDictionary(_ encoder: JSONEncoder = JSONEncoder()) throws -> [String: Any] {
        let data = try encoder.encode(self)
        let object = try JSONSerialization.jsonObject(with: data)
        guard let json = object as? [String: Any] else {
            let context = DecodingError.Context(codingPath: [], debugDescription: "Deserialized object is not a dictionary")
            throw DecodingError.typeMismatch(type(of: object), context)
        }
        return json
    }
}


