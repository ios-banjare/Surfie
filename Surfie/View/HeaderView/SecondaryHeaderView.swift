//
//  SecondaryHeaderView.swift
//  Surfie
//
//  Created by Mahadev on 30/06/21.
//

import UIKit

@objc protocol SecondaryHeaderViewDelegate: NSObjectProtocol {
    func leftMenuButtonClicked()
}

class SecondaryHeaderView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblSeprator: UILabel!

    weak var delegate: SecondaryHeaderViewDelegate?
    
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
        Bundle.main.loadNibNamed(ViewNames.secondaryHeader, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
    }

    @IBAction func btnLeftBarClicked(_ sender: Any) {
        guard let myDelegateMethod = self.delegate?.leftMenuButtonClicked else {
            return
        }
        myDelegateMethod()
    }

}
