//
//  CategoryCollectionViewCell.swift
//  Surfie
//
//  Created by Mahadev on 02/07/21.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlet -
    @IBOutlet weak var lblTitle : UILabel!
    
    //MARK: - View Cycle -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setSelectedCategory(value: Bool) {
        contentView.backgroundColor = value ? AppColor.skyBlue : .clear
        lblTitle.textColor = value ? AppColor.defaultWhite : AppColor.skyBlue
    }
    
}

