//
//  HeaderView.swift
//  Surfie
//
//  Created by Mahadev on 29/06/21.
//

import UIKit

@objc protocol HeaderViewDelegate: NSObjectProtocol {
    func leftBarButtonClicked()
    @objc optional func rightBarButtonClicked()
}

open class HeaderView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgLeft: UIImageView!
    @IBOutlet weak var imgRight: UIImageView!
    @IBOutlet weak var btnRight: UIButton!

    weak var delegate: HeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    // Public & Open May cause pro, have to test
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit()
    {
        Bundle.main.loadNibNamed(ViewNames.header, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
    }

    
    @IBAction func btnLeftBarClicked(_ sender: Any) {
        guard let myDelegateMethod = self.delegate?.leftBarButtonClicked else {
            return
        }
        myDelegateMethod()
    }
    
    @IBAction func btnRightBarClicked(_ sender: Any) {
        guard let myDelegateMethod = self.delegate?.rightBarButtonClicked else {
            return
        }
        myDelegateMethod()
    }
    
}
