//
//  ProfilePicViewController.swift
//  Surfie
//
//  Created by Apple on 27/07/21.
//

import UIKit

class ProfilePicViewController: UIViewController,  HeaderViewDelegate {
    
    //MARK: - [ IBOutlets Outlets] -
    @IBOutlet weak var lblPicDesc : UILabel!
    @IBOutlet weak var btnSubmit : UIButton!
    
    @IBOutlet weak var headerView : HeaderView!
    @IBOutlet weak var pageControl : UIPageControl!
    @IBOutlet weak var imgUser : UIImageView!
    @IBOutlet weak var imgDummy : UIImageView!
    
    //MARK: - [ ViewLifeCycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpOnLoad()
        self.setUpLocalizedText()
    }

    func setUpOnLoad() {
        headerView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setUpLocalizedText() {
        btnSubmit.setTitle("FOLLOWING".local, for: .normal)
        lblPicDesc.text = "ADD_PIC_FIRST_TIME".local
        headerView.lblTitle.text = "YOUR_PIC".local
    }

    //MARK: - [ Selector Method ] -
    
    func leftBarButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnConfirmTapped(_ sender: UIButton) {
       
    }
}
