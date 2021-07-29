//
//  MiscellaneousViewController.swift
//  Surfie
//
//  Created by Apple on 21/07/21.
//

import UIKit

class MiscellaneousViewController: UIViewController, HeaderViewDelegate {
    
    //MARK: - [ IBOutlets & Properties] -
    
    @IBOutlet weak var btnSocial : UIButton!
    @IBOutlet weak var btnRate : UIButton!
    @IBOutlet weak var btnLegal : UIButton!
    @IBOutlet weak var btnCareers : UIButton!
    @IBOutlet weak var btnProfile : UIButton!
    @IBOutlet weak var lblVersion : UILabel!
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
        btnSocial.layer.applySketchShadow()
        btnRate.layer.applySketchShadow()
        btnLegal.layer.applySketchShadow()
        btnCareers.layer.applySketchShadow()
        btnProfile.layer.applySketchShadow()

        let version = Bundle.main.infoDictionary?[kCFBundleVersionKey as String] as? String ?? StaticText.EmptyText
        let name = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String ?? StaticText.EmptyText
        self.lblVersion.text = name + StaticText.Space + version
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setUpLocalizedText() {
        headerView.lblTitle.text = "DEFINITIONS".local
        btnCareers.setTitle("CAREERS".local, for: .normal)
        btnProfile.setTitle("MY_PROFILE".local, for: .normal)
        btnRate.setTitle("RATE_APP".local, for: .normal)
        btnSocial.setTitle("SOCIAL_NETWORK".local, for: .normal)
    }

    //MARK: - [ Selector Method ] -
    
    func leftBarButtonClicked() {
        self.slideMenuController()?.openLeft()
    }
    
    @IBAction func btnMyProfileTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: StoryboardNames.Profile.rawValue, bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(withIdentifier: StoryboardIds.ProfileInfoVC) as? ProfileInfoViewController else {
            return
        }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func btnSocialTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func btnCareersTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func btnRateAppTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func btnLegalTapped(_ sender: UIButton) {
        
    }
}
