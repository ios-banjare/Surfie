//
//  TutorialViewController.swift
//  Surfie
//
//  Created by Mahadev on 25/06/21.
//  Copyright © 2021 Chauhan. All rights reserved.
//

import UIKit

struct TutorialData: Codable {
    let heading: String?
    let descriptions: String?
}

class TutorialViewController: UIViewController, TutorialCellDelegate {
    
    //MARK: - IBOutlet -
    @IBOutlet weak var cvTutorial : UICollectionView!
    @IBOutlet weak var pageIndicator : UIPageControl!
    
    //MARK: - Property -
    var arrTutorial = [TutorialData]()
    var selectedIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpOnLoad()
    }
    
     //MARK: - [ Class Helper ] -
     
     func setUpOnLoad() {
        arrTutorial = [
            TutorialData(heading: "IMMEDIATE_EQUIP_RENTAL".local,
                         descriptions: "FORGOT_EQUIP?_SOMEONE_PLACE&DELIVER".local),
            TutorialData(heading: "VAN_TENT_SURF".local,
                         descriptions: "ESC_ROUTE?_NEW_SENSATION_PARTNER".local),
            TutorialData(heading: "EXPERIENCES".local,
                         descriptions: "EXPERIENCE_NATURE_SUGGESTION".local)
        ]
         let cellNib = UINib(nibName: CustomCellIds.Tutorial,
                            bundle: Bundle.main)
         cvTutorial.register(cellNib,
                             forCellWithReuseIdentifier: CustomCellIds.Tutorial)
     }
     

    
    //MARK: - [ Selector Methods ] -
    
    @IBAction func pageControlSelection(_ sender: UIPageControl) {
        let page: Int = sender.currentPage
//        if selectedIndex != page {
            cvTutorial.scrollToItem(at: IndexPath(item: page, section: 0), at: .left, animated: false)
           // selectedIndex = page
        //}
        
    }

    func skipToNext() {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIds.Login) else {
            return
        }
        Defaults.setValueFor(key: .isTutorialDone, value: true)
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}


//MARK: - [ Collection Method ] -

extension TutorialViewController : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return self.arrTutorial.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCellIds.Tutorial, for: indexPath) as? TutorialCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.delegate = self
        cell.setTutorial(arrTutorial[indexPath.row], atIndex: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width,
                      height: collectionView.frame.size.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard scrollView == cvTutorial else {
            return
        }
        let index = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
        cvTutorial.scrollToItem(at: IndexPath(item: index, section: 0), at: .left, animated: false)
        pageIndicator.currentPage = index
    }
    
}
 
