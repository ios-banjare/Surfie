//
//  ChatTableViewCell.swift
//  Surfie
//
//  Created by Apple on 30/07/21.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    //MARK: - [ IBOutlets & Properties] -
    
    @IBOutlet weak var lblSendMessage : UILabel!
    @IBOutlet weak var lblSendDate : UILabel!
    
    @IBOutlet weak var imgReciever : UIImageView!
    @IBOutlet weak var lblRecieveMessage : UILabel!
    @IBOutlet weak var lblRecieveDate : UILabel!
    
    //MARK: - [ ViewLifeCycle ] -
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
