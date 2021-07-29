//
//  ProfileViewController.swift
//  Surfie
//
//  Created by Mahadev on 04/07/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - [ IBOutlets & Properties] -
    
    @IBOutlet weak var cvcExperience : UICollectionView!
    @IBOutlet weak var lblHeading : UILabel!
    
    
    //MARK: - [ ViewLifeCycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpOnLoad()
    }

    func setUpOnLoad() {
        cvcExperience.registerXib(nibName: CustomCellIds.ExperienceCollectionCell)
    }
}


//MARK: - [ Collection Method ] -

extension ProfileViewController : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
