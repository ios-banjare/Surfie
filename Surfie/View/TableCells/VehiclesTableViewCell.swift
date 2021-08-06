//
//  VehiclesTableViewCell.swift
//  Surfie
//
//  Created by Mahadev on 30/06/21.
//

import UIKit

@objc protocol VehicleTableCellDelegate: NSObjectProtocol {
    @objc optional func itemSelectedAt(index: Int)
}

class VehiclesTableViewCell: UITableViewCell {

    //MARK: - [ IBOutlets & Properties] -
    
    @IBOutlet weak var cvcVehicles : UICollectionView!
    @IBOutlet weak var lblHeading : UILabel!

    var oneCell: Bool = false
    weak var delegate: VehicleTableCellDelegate?
    
    //MARK: - [ ViewLifeCycle ] -
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setUpOnLoad()
    }

    func setUpOnLoad() {
        let cellNib = UINib(nibName: CustomCellIds.VehiclesCollectionCell,
                           bundle: Bundle.main)
        cvcVehicles.register(cellNib,
                            forCellWithReuseIdentifier: CustomCellIds.VehiclesCollectionCell)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


//MARK: - [ Collection Method ] -

extension VehiclesTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return oneCell ? 1 : 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CustomCellIds.VehiclesCollectionCell,
                for: indexPath) as? VehiclesCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (Screen.Width - 30)/1.5
        return CGSize(width: width,
                      height: 245
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let myDelegate = self.delegate?.itemSelectedAt else {
            return
        }
        myDelegate(indexPath.item)
    }
    
}
