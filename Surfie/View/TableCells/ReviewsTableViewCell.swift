//
//  ReviewsTableViewCell.swift
//  Surfie
//
//  Created by Mahadev on 04/07/21.
//

import UIKit

class ReviewsTableViewCell: UITableViewCell {
    
    //MARK: - [ IBOutlets & Properties] -
    
    @IBOutlet weak var lblReviews : UILabel!
    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var imgUser : UIImageView!

    var oneCell: Bool = false
    
    //MARK: - [ ViewLifeCycle ] -
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setUpOnLoad()
    }

    func setUpOnLoad() {
        lblReviews.text = "TEMP_REVIEWS".local
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
