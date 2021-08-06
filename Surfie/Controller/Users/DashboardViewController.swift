//
//  DashboardViewController.swift
//  Surfie
//
//  Created by Mahadev on 29/06/21.
//

import UIKit
import GoogleMaps

class DashboardViewController: UIViewController, SecondaryHeaderViewDelegate {
    

    //MARK: - [ IBOutlets ] -
    
    @IBOutlet weak var headerView : SecondaryHeaderView!
    @IBOutlet weak var vwCategory : UIView!
    @IBOutlet weak var googleMap : GMSMapView!
    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var lblNeed : UILabel!
    @IBOutlet weak var cvCategory : UICollectionView!
    @IBOutlet weak var btnConfirm : UIButton!
    @IBOutlet weak var gridHeight : NSLayoutConstraint!
    @IBOutlet weak var swiperHeight : NSLayoutConstraint!

    //MARK: - [ Properties] -
    var selectedCategory:Int = 0
    
    //MARK: - [ ViewLifeCycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpOnLoad()
        self.setUpLocalizedText()
    }
    
    func setUpOnLoad() {
        headerView.lblTitle.isHidden = true
        headerView.lblSubTitle.isHidden = true
        headerView.lblSeprator.isHidden = true
        headerView.delegate = self
        cvCategory.addObserver(self, forKeyPath: StaticText.ContentSize, options: .new, context: nil)
        
        //Google Map set Up
        let camera = GMSCameraPosition.camera(withLatitude: -33.86013352978327, longitude: 151.20291117578745, zoom: 16.0)
        googleMap.camera = camera
        
        //Swipe gesture for swipe up & down the view
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeUp.direction = .up
        vwCategory.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeDown.direction = .down
        vwCategory.addGestureRecognizer(swipeDown)
        
        swiperHeight.constant = self.gridHeight.constant + 285
    }
    
    func setUpLocalizedText() {
        btnConfirm.setTitle("START".local, for: .normal)
        lblName.text = Common.instance.getSalutaionWish() + StaticText.Comma + StaticText.Space + "Alexandre!"
        lblNeed.text = "WHAT_U_NEED_TODAY".local
    }


    //MARK: - [ Selector Method ] -
    
    func leftMenuButtonClicked() {
        self.slideMenuController()?.openLeft()
    }
    
    @IBAction func confirmButtonClicked(_ sender: UIButton) {
        let storyboardE = UIStoryboard(name: StoryboardNames.Experience.rawValue, bundle: nil)
        guard let nextVC = storyboardE.instantiateViewController(withIdentifier: StoryboardIds.ConfirmRouteVC) as? ConfirmRouteViewController else {
            return
        }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case .down:
                UIView.transition(with: vwCategory, duration: 0.4,
                                  options: .curveEaseInOut,
                                  animations: {
                                    self.swiperHeight.constant = 53
                              })
            case .up:
                UIView.transition(with: vwCategory, duration: 0.4,
                                  options: .curveEaseInOut,
                                  animations: {
                                    self.swiperHeight.constant = self.gridHeight.constant + 285
                              })
            default:
                break
            }
        }
    }

    //MARK: - [ KVO Methods ] --

    deinit {
        if cvCategory != nil {
            self.cvCategory.removeObserver(self, forKeyPath: StaticText.ContentSize)
        }
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let obj = object as? UICollectionView {

            if obj == cvCategory && keyPath == StaticText.ContentSize {

                if (change?[NSKeyValueChangeKey.newKey] as? CGSize) != nil {
                    let cvcHeight = ((change?[NSKeyValueChangeKey.newKey] as? CGSize)?.height)!
                    gridHeight.constant = cvcHeight
                }
            }
        }
    }
}


//MARK: - [ Collection Method ] -

extension DashboardViewController : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCellIds.CategoryCollectionCell, for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setSelectedCategory(value: selectedCategory == indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (Screen.Width - 80)/3.0,
                      height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard selectedCategory != indexPath.item else {
            return
        }
        selectedCategory = indexPath.row
        cvCategory.reloadData()
        UIView.transition(with: vwCategory, duration: 0.4,
                          options: .curveEaseInOut,
                          animations: {
                            self.swiperHeight.constant = 53})
    }
    
}
 
