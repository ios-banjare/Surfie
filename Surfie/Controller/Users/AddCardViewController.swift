//
//  AddCardViewController.swift
//  Surfie
//
//  Created by Apple on 20/07/21.
//

import UIKit

class AddCardViewController: UIViewController, HeaderViewDelegate {
    
    //MARK: - [ IBOutlets & Properties] -
    
    @IBOutlet weak var headerView : HeaderView!
    @IBOutlet weak var btnAddCard : UIButton!
    @IBOutlet weak var lblCardDesc : UILabel!
    @IBOutlet weak var txtCardNo : UITextField!

    //MARK: - [ ViewLifeCycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpOnLoad()
        self.setLocalizedText()
    }
    
    func setUpOnLoad() {
        headerView.delegate = self
    }

    func setLocalizedText() {
        lblCardDesc.text = "ADD_CARD_DESC".local.uppercased()
        btnAddCard.setTitle("NEXT".local, for: .normal)
        headerView.lblTitle.text = "ADD_CARD".local
    }
    
    //MARK: - [ Selector Method ] -
    
    func leftBarButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func addCardClicked(sender: UIButton) {
        
    }
    
}
