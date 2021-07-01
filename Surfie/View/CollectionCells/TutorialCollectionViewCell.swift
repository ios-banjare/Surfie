//
//  TutorialCollectionViewCell.swift
//  Surfie
//
//  Created by Mahadev on 25/06/21.
//  Copyright © 2021 Chauhan. All rights reserved.
//

import UIKit


protocol TutorialCellDelegate: AnyObject {
    func skipToNext()
}

class TutorialCollectionViewCell: UICollectionViewCell {

    //MARK: - IBOutlet -
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblDesc : UILabel!
    @IBOutlet weak var btnContinue : UIButton!
    @IBOutlet weak var btnSkip : UIButton!

    //MARK: - Property -
    weak var delegate: TutorialCellDelegate?
    
    //MARK: - View Cycle -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btnContinue.layer.applySketchShadow()
        setUpLocalizedText()
    }
    
    func setUpLocalizedText() {
        btnSkip.setTitle("SKIP".local, for: .normal)
        btnContinue.setTitle("START".local, for: .normal)
    }
    
    func setTutorial(_ data: TutorialData?, atIndex value: Int) {
        btnSkip.isHidden = value > 1
        btnContinue.isHidden = !btnSkip.isHidden
        guard data != nil else {
            return
        }
        lblTitle.text = data!.heading
        lblDesc.text = data!.descriptions
        btnSkip.isHidden = value > 1
        btnContinue.isHidden = !btnSkip.isHidden
    }
    
    //MARK: - [ Selector Methods ] -
    
    @IBAction func skipContinueSelection(_ sender: UIButton) {
        guard let myDelegate = self.delegate?.skipToNext else {
            return
        }
        myDelegate()
    }
    

}
