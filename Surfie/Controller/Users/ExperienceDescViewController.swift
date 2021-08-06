//
//  ExperienceDescViewController.swift
//  Surfie
//
//  Created by Apple on 29/07/21.
//

import UIKit

class ExperienceDescViewController: UIViewController, HeaderViewDelegate {
    
    //MARK: - [ IBOutlets ] -
    
    @IBOutlet weak var headerView : HeaderView!
    @IBOutlet weak var cvTop : UICollectionView!
    @IBOutlet weak var cvBottom : UICollectionView!
    @IBOutlet weak var btnConfirm : UIButton!
    @IBOutlet weak var btnPolicy : UIButton!
    @IBOutlet weak var btnDesc : UIButton!
    @IBOutlet weak var btnCondition : UIButton!
    @IBOutlet weak var vwRate : CosmosView!

    @IBOutlet weak var lblHeading : UILabel!
    @IBOutlet weak var lblRating : UILabel!
    @IBOutlet weak var lblSubHeading : UILabel!
    @IBOutlet weak var lblReviewCount : UILabel!
    @IBOutlet weak var middleSpace : NSLayoutConstraint!

    //MARK: - [ Properties] -
    var inForest: Bool = false
    
    
    //MARK: - [ ViewLifeCycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpOnLoad()
        self.setUpLocalizedText()
    }
    
    func setUpOnLoad() {
        headerView.delegate = self
        headerView.lblTitle.textColor = .white
    }
    
    func setUpLocalizedText() {
        btnConfirm.setTitle("CONFIRM".local.uppercased(), for: .normal)
        btnPolicy.setTitle("POLICY".local, for: .normal)
        btnCondition.setTitle("CONDITION".local, for: .normal)
        btnDesc.setTitle("DESCRIPTION".local, for: .normal)
        lblSubHeading.text = "MEDITATE_DESC_TEMP".local
        headerView.lblTitle.text = "GLAMPER EXPERIENCE"
        if inForest {
            lblHeading.text = "REINVENT_TRAVEL_WITH".local + StaticText.Space + "Nomad Gampler"
            headerView.lblTitle.text = "GLAMPER EXPERIENCE"
            lblSubHeading.isHidden = true
            middleSpace.constant = 235
        } else {
            lblHeading.text = "MEDITATE_WITH".local + StaticText.Space + "BREATHE Portugal"
            headerView.lblTitle.text = "MEDITATE_IN_FOREST".local
            lblSubHeading.isHidden = false
            middleSpace.constant = lblSubHeading.frame.size.height + 40
        }
        cvBottom.isHidden = !lblSubHeading.isHidden
    }


    //MARK: - [ Selector Method ] -
    
    func leftBarButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func confirmButtonClicked(_ sender: UIButton) {
        let storyboardE = UIStoryboard(name: StoryboardNames.Profile.rawValue, bundle: nil)
        guard let nextVC = storyboardE.instantiateViewController(withIdentifier: StoryboardIds.SurfVC) as? SurfViewController else {
            return
        }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func descriptionButtonClicked(_ sender: UIButton) {
        
    }
    
    @IBAction func policyButtonClicked(_ sender: UIButton) {
        
    }
    
    @IBAction func conditionButtonClicked(_ sender: UIButton) {
        
    }
}



//MARK: - [ Collection Method ] -

extension ExperienceDescViewController : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let strId = collectionView == cvTop ? CustomCellIds.ReinventImageCell : CustomCellIds.ReinventTravelDescCell
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: strId,
                for: indexPath) as? DefaultCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if cvTop == collectionView {
            let height = Screen.Width * (4/5)
            return CGSize(width: Screen.Width,
                          height: height
            )
        } else {
            let width = (Screen.Width - 37)/1.5
            return CGSize(width: width,
                          height: 190
            )
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
    }
    
}
