//
//  BaseViewController.swift
//  Surfie
//
//  Created by Mahadev on 04/09/20.
//  Copyright © 2020 Chauhan. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation



class BaseViewController: UIViewController {
    
    //MARK: - [ Life Cycle ] -
    
    private var savedRequests: [DispatchWorkItem] = []
    static let sharedInstance = BaseViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        
        self.navigationController?.navigationBar.tintColor = AppColor.primaryTextColor!
        self.navigationController?.navigationBar.titleTextAttributes  = [NSAttributedString.Key.foregroundColor : AppColor.primaryTextColor!,
                                                                         NSAttributedString.Key.font: UIFont(name: "FontNameConstant.Medium", size: 16)!
        ]
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(appDiDBecomeActive),
                                               name: UIApplication.didBecomeActiveNotification,
                                               object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIApplication.didBecomeActiveNotification,
                                                  object: nil)
    }
    
    deinit {
        
        NotificationCenter.default.removeObserver(self,
                                                  name: UIApplication.didBecomeActiveNotification,
                                                  object: nil)
    }
    
    
    
    //MARK: - [ Notification Method ] -
    
    @objc func appDiDBecomeActive() {
        //Overidden in required controller
    }
    /**
     Call This Function in Each Class where data need to be refreshed when Network will be available.
     */
    @objc func networkAvailableNotification() {
        //Overidden in required controller
    }
    
    //MARK: - [ Navigation Bar Methods ] -
    
    
    func navigationTitleSetup(strTitle : String){
        let title = UILabel()
        title.text = strTitle
        title.textColor = AppColor.primaryTextColor
        title.font = UIFont.systemFont(ofSize: 16)
        
        let spacer = UIView()
        let constraint = spacer.widthAnchor.constraint(greaterThanOrEqualToConstant: CGFloat.greatestFiniteMagnitude)
        constraint.isActive = true
        constraint.priority = .defaultLow
        self.navigationItem.setHidesBackButton(true, animated: true)
        let stack = UIStackView(arrangedSubviews: [title,spacer])
        stack.axis = .horizontal
        navigationItem.titleView = stack
    }
    
    func configureUIForRightToLeftUIMode() {
        debugPrint("Right to left UI loaded")
    }
    
    func leftBarButton(_ imageName: String, title: String?, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        var width: CGFloat = 16.0
        let marginSpace: CGFloat = 8
        
        button.frame = CGRect(x: 0, y: 0, width: width, height: width)
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        var titleLabel: UILabel?
        var iconImageView: UIImageView?
        
        if let icon = UIImage(named: imageName) {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: width))
            imageView.image = icon
            imageView.isUserInteractionEnabled = false
            imageView.backgroundColor = .clear
            imageView.sizeToFit()
            button.addSubview(imageView)
            iconImageView = imageView
        }
        
        if let textContent = title {
            let screenWidthBy30Percent = Screen.Width/4
            let textLayer = UILabel(frame: CGRect(x: width + marginSpace, y: 0, width: screenWidthBy30Percent - width, height: width))
            textLayer.adjustsFontSizeToFitWidth = true
            textLayer.minimumScaleFactor = 0.5
            textLayer.textColor = AppColor.primaryTextColor
            let textString = NSMutableAttributedString(string: textContent, attributes: [
                NSAttributedString.Key.font: UIFont(name: "FontNameConstant.Medium", size: 16)!
            ])
            let textRange = NSRange(location: 0, length: textString.length)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 1.5
            textString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: textRange)
            textLayer.attributedText = textString
            textLayer.sizeToFit()
            width += textLayer.intrinsicContentSize.width + marginSpace
            button.addSubview(textLayer)
            textLayer.center.y = button.center.y
            titleLabel = textLayer
        }
        button.frame.size.width = width
        button.widthAnchor.constraint(equalToConstant: width).isActive = true
        button.heightAnchor.constraint(equalToConstant: 16.0).isActive = true
        return UIBarButtonItem(customView: button)
    }
    
    func rightBarButton(_ imageName: String, withCount: Int, selector: Selector) -> UIBarButtonItem {
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        button.widthAnchor.constraint(equalToConstant: 35).isActive = true
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        var width: CGFloat = 35.0
        if withCount > 0 {
            let textLayer = UILabel(frame: CGRect(x: 20, y: 0, width: 14, height: 14))
            textLayer.numberOfLines = 1
            textLayer.backgroundColor = AppColor.errorColor
            textLayer.textAlignment = .center
            textLayer.layer.cornerRadius = 7
            textLayer.clipsToBounds = true
            textLayer.adjustsFontSizeToFitWidth = true
            textLayer.minimumScaleFactor = 0.5
            textLayer.textColor = UIColor.white
            textLayer.font = UIFont.systemFont(ofSize: 16)
            textLayer.text = " "
            width = textLayer.frame.size.width + 20.0
            button.addSubview(textLayer)
        }
        button.frame.size.width = width
        return UIBarButtonItem(customView: button)
    }
    
    
    func rightBar(_ withTitle: String) -> UIBarButtonItem {
        let textLayer = UILabel(frame: CGRect(x: 0, y: 0, width: Screen.Width/3, height: 44))
        textLayer.numberOfLines = 1
        textLayer.adjustsFontSizeToFitWidth = true
        textLayer.minimumScaleFactor = 0.5
        textLayer.textColor = AppColor.primaryTextColor
        let textContent = withTitle
        let textString = NSMutableAttributedString(string: textContent, attributes: [
            NSAttributedString.Key.font: UIFont(name: "FontNameConstant.Medium", size: 16)!
        ])
        let textRange = NSRange(location: 0, length: textString.length)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1.5
        textString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: textRange)
        textLayer.attributedText = textString
        textLayer.sizeToFit()
        return UIBarButtonItem(customView: textLayer)
    }
    
    
    func setUpRightNavigationBar() {
        DispatchQueue.main.async {
            let rightButton = self.rightBarButton("IconName.Bell", withCount: 0, selector: #selector(self.notificationTapped(_:)))
            self.navigationItem.rightBarButtonItem = rightButton
        }
    }
    
    func setUpNotificationRightNavigationBar() {
        DispatchQueue.main.async {
            let button = UIButton(type: .custom)
            button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            button.widthAnchor.constraint(equalToConstant: 24).isActive = true
            button.heightAnchor.constraint(equalToConstant: 24).isActive = true
            let textLayer = UILabel(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
            textLayer.numberOfLines = 1
            textLayer.backgroundColor = AppColor.errorColor
            textLayer.textAlignment = .center
            textLayer.layer.cornerRadius = 12
            textLayer.clipsToBounds = true
            textLayer.adjustsFontSizeToFitWidth = true
            textLayer.minimumScaleFactor = 0.3
            textLayer.textColor = UIColor.white
            textLayer.font = UIFont.systemFont(ofSize: 16)
            textLayer.text = ""
            button.addSubview(textLayer)
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
    
    @objc func notificationTapped(_ sender: Any) {
        
    }
    
}



