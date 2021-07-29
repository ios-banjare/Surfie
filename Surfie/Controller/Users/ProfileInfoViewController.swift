//
//  ProfileInfoViewController.swift
//  Surfie
//
//  Created by Apple on 27/07/21.
//

import UIKit

class ProfileInfoViewController: UIViewController,  HeaderViewDelegate {
    
    //MARK: - [ IBOutlets Outlets] -
    @IBOutlet weak var lblNameDesc : UILabel!
    @IBOutlet weak var lblHeightDesc : UILabel!
    @IBOutlet weak var lblShoesDesc : UILabel!
    @IBOutlet weak var btnSubmit : UIButton!
    
    @IBOutlet weak var headerView : HeaderView!
    @IBOutlet weak var txtFirstName : UITextField!
    @IBOutlet weak var txtLastName : UITextField!
    @IBOutlet weak var txtHeight : UITextField!
    @IBOutlet weak var txtShoesSize : UITextField!
    
    //MARK: - [ ViewLifeCycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpOnLoad()
        self.setUpLocalizedText()
    }

    func setUpOnLoad() {
        headerView.delegate = self
        txtFirstName.layer.applySketchShadow()
        txtLastName.layer.applySketchShadow()
        txtHeight.layer.applySketchShadow()
        txtShoesSize.layer.applySketchShadow()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setUpLocalizedText() {
        btnSubmit.setTitle("FOLLOWING".local, for: .normal)
        lblNameDesc.text = "ENTER_FIRST_LAST_NAME".local + StaticCharacter.Column
        lblHeightDesc.text = "ENTER_HEIGHT".local + StaticCharacter.Column
        lblShoesDesc.text = "SHOE_SIZE".local + StaticCharacter.Column
       
        
        txtFirstName.placeholder = "FIRST".local
        txtLastName.placeholder = "LAST".local
        headerView.lblTitle.text = "INFORMATION".local
    }

    //MARK: - [ Selector Method ] -
    
    func leftBarButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnConfirmTapped(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIds.EmailVC) as? EmailViewController else {
            return
        }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
