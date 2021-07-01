//
//  ExperienceTableViewCell.swift
//  Surfie
//
//  Created by Mahadev on 01/07/21.
//

import UIKit

class ExperienceTableViewCell: UITableViewCell {
    
    //MARK: - [ IBOutlets & Properties] -
    
    @IBOutlet weak var cvcExperience : UICollectionView!
    @IBOutlet weak var lblHeading : UILabel!
    @IBOutlet weak var lblSubHeading : UILabel!
    
    //MARK: - [ ViewLifeCycle ] -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setUpOnLoad()
    }

    func setUpOnLoad() {
        cvcExperience.registerXib(nibName: CustomCellIds.ExperienceCollectionCell)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


//MARK: - [ Collection Method ] -

extension ExperienceTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CustomCellIds.ExperienceCollectionCell,
                for: indexPath) as? ExperienceCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setExperienceData(nil, atIndex: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (Screen.Width - 40)/2.15
        return CGSize(width: width,
                      height: 250)
    }
    
}
