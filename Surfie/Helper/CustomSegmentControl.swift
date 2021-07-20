//
//  CategoryCollectionViewCell.swift
//  Surfie
//
//  Created by Mahadev on 02/07/21.
//
//

import UIKit

//@IBDesignable
class CustomSegmentControl: UIControl {
    
    //MARK: - Properties
    var buttons = [UIButton]()
    var selector: UIView!
    var selectedSegmentIndex = 0
    
    @IBInspectable var commaSeperatedButtonTitles: String = "" {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var selectorColor: UIColor = AppColor.orangeColor! {
        didSet {
            updateView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Helper Method -
    func updateView() {
        
        buttons.removeAll()
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        
        let buttonTitles = commaSeperatedButtonTitles.components(separatedBy: ",")
        
        for buttonTitle in buttonTitles {
            let btnTxt = NSAttributedString(string:buttonTitle, attributes: [NSAttributedString.Key.foregroundColor: AppColor.defaultBlack?.withAlphaComponent(0.64) ?? .white, NSAttributedString.Key.font : UIFont(name: FontNames.Regular, size: 16)!])
            
            let button = UIButton(type: .custom)
            button.setAttributedTitle(btnTxt, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button)
        }
        
        let buttonSelectedTxt = NSAttributedString(string:(buttons[selectedSegmentIndex].titleLabel?.text)!, attributes: [NSAttributedString.Key.foregroundColor: AppColor.defaultBlack ?? .white, NSAttributedString.Key.font : UIFont(name: FontNames.Regular, size: 16)!])
        
        buttons[selectedSegmentIndex].setAttributedTitle(buttonSelectedTxt, for: .normal)
        
        let selectorWidth = (Screen.Width - 32) / CGFloat(buttonTitles.count) - CGFloat(buttonTitles.count - 1)
        // Fix Segment for Arabic Language
        var indexAccordingToLanguage = selectedSegmentIndex
        
        if self.isRightToLeftUI{
            indexAccordingToLanguage = (buttons.count - 1)-selectedSegmentIndex
        }
        let  x = (((Screen.Width - 32) / CGFloat(buttons.count)) * CGFloat(indexAccordingToLanguage)) + CGFloat(indexAccordingToLanguage)
        let y =    (self.frame.maxY - self.frame.minY) - 1.5
        
        selector = UIView(frame: CGRect(x: x, y: y, width: selectorWidth, height: 3.0))
        selector.backgroundColor = selectorColor
        selector.layer.cornerRadius = 1.5
        addSubview(selector)
        
        // Create a StackView
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0.0
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true

    }

    //MARK: - Button Selector -
    @objc func buttonTapped(button: UIButton) {

        for (buttonIndex,btn) in buttons.enumerated() {
            
             let btnTxt = NSAttributedString(string:(btn.titleLabel?.text)!, attributes: [NSAttributedString.Key.foregroundColor: AppColor.defaultBlack?.withAlphaComponent(0.64) ?? .white, NSAttributedString.Key.font : UIFont(name: FontNames.Regular, size: 16)!])
            btn.setAttributedTitle(btnTxt, for: .normal)

            if btn == button {
                // Fix Segment for Arabic Language
                var indexAccordingToLanguage = buttonIndex
                if self.isRightToLeftUI{
                    indexAccordingToLanguage = (buttons.count - 1)-buttonIndex
                }
                selectedSegmentIndex = buttonIndex
                let  selectorStartPosition = (((Screen.Width - 48) / CGFloat(buttons.count)) * CGFloat(indexAccordingToLanguage)) + CGFloat(indexAccordingToLanguage)
                UIView.animate(withDuration: 0.3, animations: {
                    self.selector.frame.origin.x = selectorStartPosition
                })
                
                let btnSelectedTxt = NSAttributedString(string:(btn.titleLabel?.text)!, attributes: [NSAttributedString.Key.foregroundColor: AppColor.defaultBlack ?? .white, NSAttributedString.Key.font : UIFont(name: FontNames.Regular, size: 16)!])
                btn.setAttributedTitle(btnSelectedTxt, for: .normal)
            }
        }
        sendActions(for: .valueChanged)
    }
}




class CustomSegmentedControl: UISegmentedControl{
    private let segmentInset: CGFloat = 5       //your inset amount
    private let segmentImage: UIImage? = UIImage(color: AppColor.skyBlue ?? .gray)   //your color

    override func layoutSubviews(){
        super.layoutSubviews()

        //background
        layer.cornerRadius = bounds.height/2
        //foreground
        let foregroundIndex = numberOfSegments
        if subviews.indices.contains(foregroundIndex), let foregroundImageView = subviews[foregroundIndex] as? UIImageView
        {
            foregroundImageView.bounds = foregroundImageView.bounds.insetBy(dx: segmentInset, dy: segmentInset)
            foregroundImageView.image = segmentImage    //substitute with our own colored image
            foregroundImageView.layer.removeAnimation(forKey: "SelectionBounds")    //this removes the weird scaling animation!
            foregroundImageView.layer.masksToBounds = true
            foregroundImageView.layer.cornerRadius = foregroundImageView.bounds.height/2
        }
        
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: AppColor.defaultWhite]
        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: AppColor.defaultBlack]
            self.setTitleTextAttributes(titleTextAttributes1, for: .normal)
            self.setTitleTextAttributes(titleTextAttributes, for: .selected)
        self.backgroundColor = AppColor.defaultWhite
    }
}

