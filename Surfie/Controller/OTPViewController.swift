//
//  OTPViewController.swift
//  Surfie
//
//  Created by Mahadev on 25/06/21.
//  Copyright © 2021 Chauhan. All rights reserved.
//

import Foundation
import UIKit

class OTPViewController: UIViewController ,HeaderViewDelegate {
    
    //MARK: - [ IBOutlets & Properties] -
    
    @IBOutlet weak var txtFirst : UITextField!
    @IBOutlet weak var txtSecond : UITextField!
    @IBOutlet weak var txtThird : UITextField!
    @IBOutlet weak var txtFourth : UITextField!
    @IBOutlet weak var btnSubmit : UIButton!
    @IBOutlet weak var btnResend : UIButton!
    @IBOutlet weak var lblEnterCode : UILabel!
    @IBOutlet weak var headerView : HeaderView!

    var strEmail : String!
    var strOTP : String!

    //MARK: - [ ViewLifeCycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpOnLoad()
        self.setUpLocalizedText()
    }

    func setUpOnLoad() {
        headerView.delegate = self
        headerView.lblTitle.text = "LOGIN".local
        txtFirst.layer.applySketchShadow()
        txtSecond.layer.applySketchShadow()
        txtThird.layer.applySketchShadow()
        txtFourth.layer.applySketchShadow()
//        self.btnSubmit.alpha = 0.4
//        self.btnSubmit.isUserInteractionEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setUpLocalizedText() {
        btnSubmit.setTitle("NEXT".local, for: .normal)
        btnResend.setTitle("CODE_NOT_RECEIVED".local, for: .normal)
        lblEnterCode.text = "ENTER_RECEIVED_CODE".local
    }

    //MARK: - [ Selector Method ] -
    
    func leftBarButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSubmitTapped(_ sender: UIButton) {
        Defaults.setValueFor(key: .selectedTab,
                             value: TabNames.rent.rawValue)
        Common.instance.rootToSideMenu(
            controllerBy: StoryboardIds.Home,
            andByStorybord: StoryboardNames.Main.rawValue)
    }
    
    @IBAction func btnResendTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func textEditingDidChange(_ sender: Any) {
        
        let totalStr = String(format : "%@%@%@%@",txtFirst.text!,txtSecond.text!,txtThird.text!,txtFourth.text!)
        let count = totalStr.count
        if(count == 4)
        {
            self.btnSubmit.isUserInteractionEnabled = true
            self.btnSubmit.alpha = 1
        }
        else{
            self.btnSubmit.isUserInteractionEnabled = false
            self.btnSubmit.alpha = 0.4
        }
    }
}


//MARK: - [ TextField Methods ] -

extension OTPViewController : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        do {
            // This allows numeric text only, but also backspace for deletes
            if string.count > 0 && !Scanner(string: string).scanInt64(nil) {
                return false
            }
            if Int(range.location) > 0 {
                return false
            }
            let  char = string.cString(using: String.Encoding.utf8)!
            let isBackSpace = strcmp(char, StaticText.Backspace)
            if (isBackSpace != -92) && (textField.text?.count ?? 0) > 0 {
                return false
            }
            if (isBackSpace == -92) {
                // back pressed
                perform(#selector(keyboardInputShouldDelete), with: textField, afterDelay: 0)
            }
            if (textField.text?.count ?? 0) == 0 {
                perform(#selector(changeTextFieldFocus), with: textField, afterDelay: 0)
            }
            return true
        }
    }
    
    @objc func changeTextFieldFocus(toNextTextField textField: UITextField?) {
        let tagValue: Int = (textField?.tag ?? 0) + 1
        let txtField = view.viewWithTag(tagValue) as? UITextField
        txtField?.becomeFirstResponder()
    }
        
    @objc func keyboardInputShouldDelete(_ textField: UITextField?) -> Bool {
        let shouldDelete = true
        if (textField?.text?.count ?? 0) == 0 && (textField?.text == StaticText.EmptyText) {
            let tagValue: Int = (textField?.tag ?? 0) - 1
            let txtField = view.viewWithTag(tagValue) as? UITextField
            txtField?.becomeFirstResponder()
        }
        return shouldDelete
    }
    
}




