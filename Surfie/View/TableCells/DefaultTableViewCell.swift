//
//  DefaultTableViewCell.swift
//  Surfie
//
//  Created by Apple on 19/07/21.
//

import UIKit

class DefaultTableViewCell: UITableViewCell {

    //MARK: - [ IBOutlets & Properties] -
    
    @IBOutlet weak var lblSubHeading : UILabel!
    @IBOutlet weak var lblHeading : UILabel!
    @IBOutlet weak var imgView : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
