//
//  SurfViewController.swift
//  Surfie
//
//  Created by Apple on 26/07/21.
//

import UIKit

class SurfViewController: UIViewController, HeaderViewDelegate {
    
    //MARK: - [ UILabel Outlets] -
    @IBOutlet weak var lblPeople : UILabel!
    @IBOutlet weak var lblLimit : UILabel!
    @IBOutlet weak var lblFact : UILabel!
    @IBOutlet weak var lblTotal : UILabel!
    @IBOutlet weak var lblBoard : UILabel!
    @IBOutlet weak var lblLongBoard : UILabel!
    @IBOutlet weak var lblPracticeBoard : UILabel!
    @IBOutlet weak var lblNoReq : UILabel!
    @IBOutlet weak var lblDontNeed : UILabel!
    @IBOutlet weak var lblNeedClass : UILabel!
    @IBOutlet weak var lblAdditionNote : UILabel!
    @IBOutlet weak var lblDetail : UILabel!
    @IBOutlet weak var lblClassRoom : UILabel!
    @IBOutlet weak var lblTax : UILabel!
    @IBOutlet weak var lblFact1x : UILabel!
    @IBOutlet weak var lblBoard1x : UILabel!
    @IBOutlet weak var lblTotalPrice : UILabel!
    @IBOutlet weak var lblTaxPrice : UILabel!
    @IBOutlet weak var lblClassPrice : UILabel!
    @IBOutlet weak var lblFact1xPrice : UILabel!
    @IBOutlet weak var lblBoard1xPrice : UILabel!
    @IBOutlet weak var lblPeopleCount : UILabel!

    //MARK: - [ UIButton Outlets] -

    @IBOutlet weak var btnSubmit : UIButton!
    @IBOutlet weak var btnLongBoard : UIButton!
    @IBOutlet weak var btnParctBoard : UIButton!
    @IBOutlet weak var btnNoBoard : UIButton!
    @IBOutlet weak var btnNoFact : UIButton!
    @IBOutlet weak var btnSmall : UIButton!
    @IBOutlet weak var btnMS : UIButton!
    @IBOutlet weak var btnMedium : UIButton!
    @IBOutlet weak var btnML : UIButton!
    @IBOutlet weak var btnLarge : UIButton!
    @IBOutlet weak var btnXL : UIButton!
    
    //MARK: - [ Other Outlets] -
    @IBOutlet weak var classSwitch : UISwitch!
    @IBOutlet weak var headerView : HeaderView!
    @IBOutlet weak var txtNote : UITextView!
    @IBOutlet weak var imgTop : UIImageView!

    var peopleLimit: Int = 4
    var arrFact: [UIButton] = []
    var arrBoard: [UIButton] = []
    
    //MARK: - [ ViewLifeCycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpOnLoad()
        self.setUpLocalizedText()
    }

    func setUpOnLoad() {
        headerView.delegate = self
        headerView.lblTitle.text = "SURF"
        lblPeopleCount.text = "1"
        arrFact = [btnSmall, btnMS, btnMedium, btnML, btnLarge, btnXL, btnNoFact]
        arrBoard = [btnParctBoard, btnLongBoard, btnNoBoard]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setUpLocalizedText() {
        btnSubmit.setTitle("CONFIRM".local.uppercased(), for: .normal)
        lblPeople.text = "PEOPLE".local
        lblLimit.text = "LIMIT".local + StaticCharacter.Column + StaticText.Space + "\(peopleLimit)"
        lblFact.text = "FACT".local
        lblNeedClass.text = "WANT_CLASS".local
        lblClassRoom.text = "CLASS_ROOM".local
        
        lblAdditionNote.text = "ADDITIONAL_NOTE".local + StaticCharacter.Column + StaticText.Space + "(\("OPTIONAL".local))"
        lblBoard.text = "BOARD".local
        lblPracticeBoard.text = "PRACTISE_BOARD".local
        lblLongBoard.text = "LONGBOARD_BOARD".local
        lblNoReq.text = "DONT_NEED".local
 
        lblBoard1x.text = "BOARD".local + StaticText.Space + "1x"
        lblFact1x.text = "FACT".local + StaticText.Space + "1x"
        lblDontNeed.text = "DONT_NEED".local
        lblTax.text = "SERVICE_CHARGE".local
        lblDetail.text = "DETAITS".local
    }

    //MARK: - [ Selector Method ] -
    
    func leftBarButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnConfirmTapped(_ sender: UIButton) {
       
    }
    
    @IBAction func btnAddSubtractPeople(_ sender: UIButton) {
        var count = Int(lblPeopleCount.text ?? "1")!
        if sender.tag == 100 {
            guard count > 1 else {
                return
            }
            count = count - 1
        } else {
            guard count < peopleLimit else {
                return
            }
            count = count + 1
        }
        lblPeopleCount.text = "\(count)"
    }
    
    @IBAction func btnFactTapped(_ sender: UIButton) {
        for btnFact in arrFact {
            btnFact.isSelected = btnFact.tag == sender.tag
        }
    }
    
    @IBAction func btnBoardTapped(_ sender: UIButton) {
        for btnBoard in arrBoard {
            btnBoard.isSelected = btnBoard.tag == sender.tag
        }
    }
    
    @IBAction func switchOnChange(_ sender: UISwitch) {
        
    }
    
    @IBAction func btnDetailTapped(_ sender: UIButton) {
        
    }
}

