//
//  HistoryViewController.swift
//  Surfie
//
//  Created by Apple on 20/07/21.
//

import UIKit

class HistoryViewController: UIViewController, HeaderViewDelegate {
    

    //MARK:- IB Outlets -
    
    @IBOutlet var segmentedControl: CustomSegmentControl!
    @IBOutlet var headerView : HeaderView!

    //MARK: - [ Property ] -
    
    private var pageController: UIPageViewController!
    private var arrVC:[UIViewController] = []
    private var currentPage: Int!
 
    
    lazy var firstVC: UIViewController = {
        return UIViewController()
    }()
    
    lazy var secondVC: UIViewController = {
        return UIViewController()
    }()
    
    lazy var thirdVC: UIViewController = {
        return UIViewController()
    }()
    
    //MARK: - [ View Life Cycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.delegate = self
        headerView.lblTitle.text = "HISTORY".local
        currentPage = 0
        configureSegmentControl()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //MARK: - [ Class Helper ] -
    
    func configureSegmentControl() {
        
        segmentedControl.commaSeperatedButtonTitles = "RENT".local + StaticText.Comma + "VEHICLES".local  + StaticText.Comma + "EXPERIENCE".local
        segmentedControl.addTarget(self, action: #selector(onChangeOfSegment(_:)), for: .valueChanged)
        arrVC.append(firstVC)
        arrVC.append(secondVC)
        arrVC.append(thirdVC)
    }
    
    @objc func onChangeOfSegment(_ sender: CustomSegmentControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
//            pageController.setViewControllers([arrVC[0]], direction: UIPageViewController.NavigationDirection.reverse, animated: false, completion: nil)
            currentPage = 0
        case 1:
//            let direction = currentPage > 1 ? UIPageViewController.NavigationDirection.reverse : UIPageViewController.NavigationDirection.forward
//            pageController.setViewControllers([arrVC[1]], direction: direction, animated: false, completion: nil)
            currentPage = 1
        case 2:
//            pageController.setViewControllers([arrVC[2]], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
            currentPage = 2
        default:
            break
        }
    }
    
    func leftBarButtonClicked() {
        self.slideMenuController()?.openLeft()
    }

}
