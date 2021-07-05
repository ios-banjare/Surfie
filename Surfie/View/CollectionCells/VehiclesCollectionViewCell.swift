//
//  VehiclesCollectionViewCell.swift
//  Surfie
//
//  Created by Mahadev on 30/06/21.
//

import UIKit

class VehiclesCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlet -
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblDesc : UILabel!
    @IBOutlet weak var vwRating : CosmosView!
    @IBOutlet weak var imgVehicle : UIImageView!
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
    
    func setVehicleData(_ data: TutorialData?, atIndex value: Int) {

    }

}
