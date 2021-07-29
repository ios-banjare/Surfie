//
//  HistoryTableViewCell.swift
//  Surfie
//
//  Created by Apple on 21/07/21.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    //MARK: - [ IBOutlets & Properties] -
    
    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var lblSource : UILabel!
    @IBOutlet weak var lblPrice : UILabel!
    @IBOutlet weak var lblDetails : UILabel!
    @IBOutlet weak var lblDestination : UILabel!
    @IBOutlet weak var imgSource : UIImageView!
    @IBOutlet weak var imgDestination : UIImageView!
    @IBOutlet weak var vwContent : UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpOnLoad()
    }

    func setUpOnLoad() {
        let lineLayer = CAShapeLayer()
        lineLayer.strokeColor = UIColor.gray.cgColor
        lineLayer.lineWidth = 1.5
        lineLayer.lineDashPattern = [4,4]
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: imgSource.frame.midX, y: imgSource.frame.maxY),
                                CGPoint(x: imgSource.frame.midX, y: imgDestination.frame.minY)])
        lineLayer.path = path
        self.vwContent.layer.addSublayer(lineLayer)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
