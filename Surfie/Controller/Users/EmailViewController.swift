//
//  EmailViewController.swift
//  Surfie
//
//  Created by Apple on 27/07/21.
//

import UIKit

class EmailViewController: UIViewController,  HeaderViewDelegate {
    
    //MARK: - [ IBOutlets Outlets] -
    @IBOutlet weak var lblEmailDesc : UILabel!
    @IBOutlet weak var btnSubmit : UIButton!
    
    @IBOutlet weak var headerView : HeaderView!
    @IBOutlet weak var txtEmail : UITextField!
    @IBOutlet weak var txtConfirmEmail : UITextField!
    @IBOutlet weak var imgDummy : UIImageView!
    @IBOutlet weak var pageControl : UIPageControl!
    
    //MARK: - [ ViewLifeCycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpOnLoad()
        self.setUpLocalizedText()
    }

    func setUpOnLoad() {
        headerView.delegate = self
        txtEmail.layer.applySketchShadow()
        txtConfirmEmail.layer.applySketchShadow()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setUpLocalizedText() {
        btnSubmit.setTitle("FOLLOWING".local, for: .normal)
        lblEmailDesc.text = "ENTER_EMAIL_FIRST_TIME".local
        txtConfirmEmail.placeholder = "CONFIRM_EMAIL".local.lowercased()
        headerView.lblTitle.text = "YOUR_EMAIL".local
    }

    //MARK: - [ Selector Method ] -
    
    func leftBarButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnConfirmTapped(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIds.ProfilePicVC) as? ProfilePicViewController else {
            return
        }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
