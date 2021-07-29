//
//  InviteFriendViewController.swift
//  Surfie
//
//  Created by Apple on 24/07/21.
//

import UIKit

class InviteFriendViewController: UIViewController, HeaderViewDelegate {
    
    //MARK: - [ IBOutlets & Properties] -
    
    @IBOutlet weak var txtCode : UITextField!
    @IBOutlet weak var lblCode : UILabel!
    @IBOutlet weak var btnInvite : UIButton!
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblDesc : UILabel!
    @IBOutlet weak var headerView : HeaderView!

    //MARK: - [ ViewLifeCycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpOnLoad()
        self.setUpLocalizedText()
    }

    func setUpOnLoad() {
        headerView.delegate = self
        headerView.lblTitle.isHidden = true
        txtCode.layer.applySketchShadow()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setUpLocalizedText() {
        btnInvite.setTitle("INVITE".local, for: .normal)
        lblCode.text = "CODE".local
        lblTitle.text = "INVITE_EARN".local
        lblDesc.text = "CREDIT_ON_FRIEND_PURCAHSE".local
    }

    //MARK: - [ Selector Method ] -
    
    func leftBarButtonClicked() {
        self.slideMenuController()?.openLeft()
    }
  
    @IBAction func btnInviteTapped(_ sender: UIButton) {
        
    }
    
}
