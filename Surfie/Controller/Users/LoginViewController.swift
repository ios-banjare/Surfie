//
//  LoginViewController.swift
//  Surfie
//
//  Created by Mahadev on 24/06/21.
//  Copyright © 2021 Chauhan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - [ IBOutlets & Properties] -
    
    @IBOutlet weak var txtNumber : UITextField!
    @IBOutlet weak var imgFlag : UIImageView!
    @IBOutlet weak var lblCC : UILabel!
    @IBOutlet weak var lblWelcome : UILabel!
    @IBOutlet weak var lblAdventure : UILabel!
    @IBOutlet weak var lblStartNow : UILabel!
    @IBOutlet weak var btnNext : UIButton!

    //MARK: - [ ViewLifeCycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpLocalizedText()
    }
    
    func setUpLocalizedText() {
        txtNumber.placeholder = "PHONE_NO".local
        btnNext.setTitle("NEXT".local, for: .normal)
        lblStartNow.text = "START_NOW".local
        lblWelcome.text = "WELCOME_TO_SURFIE".local
        lblAdventure.text = "ADVENTURE_STARTS_HERE".local
    }

    //MARK: - [ Selector Method ] -
    
    @IBAction func btnSubmitTapped(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIds.OTP) else {
            return
        }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func btnCountryTapped(_ sender: UIButton) {
        
    }
    

}
