//
//  ExperienceCollectionViewCell.swift
//  Surfie
//
//  Created by Mahadev on 01/07/21.
//

import UIKit

class ExperienceCollectionViewCell: UICollectionViewCell {

    //MARK: - IBOutlet -
    @IBOutlet weak var lblExpert : UILabel!
    @IBOutlet weak var lblDesc : UILabel!
    @IBOutlet weak var vwExpert : UIView!
    @IBOutlet weak var imgExpert : UIImageView!
    @IBOutlet weak var imgExperience : UIImageView!
    @IBOutlet weak var vwImageContainer : UIView!

    //MARK: - View Cycle -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpOnLoad()
    }
    
    func setUpOnLoad() {
        vwImageContainer.layer.applySketchShadow()
    }
    
    func setExperienceData(_ data: TutorialData?, atIndex value: Int) {
        vwExpert.isHidden = value%2 == 0
    }

}
