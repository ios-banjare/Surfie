//
//  CustomTextField.swift
//  Surfie
//
//  Created by Mahadev on 02/09/20.
//  Copyright © 2020 Chauhan. All rights reserved.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    
    @IBInspectable
    var inset: CGFloat = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for subview in subviews {
            if let label = subview as? UILabel {
                label.minimumScaleFactor = 0.5
                label.adjustsFontSizeToFitWidth = true
            }
        }
    }
    
    override var isSecureTextEntry: Bool {
        didSet {
            if isFirstResponder {
                _ = becomeFirstResponder()
            }
        }
    }
    
    override func becomeFirstResponder() -> Bool {
        let success = super.becomeFirstResponder()
        if isSecureTextEntry, let text = self.text {
            self.text?.removeAll()
            insertText(text)
        }
        return success
    }
    
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: inset, dy: inset)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
}
