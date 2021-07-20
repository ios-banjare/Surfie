//
//  ExpertProfileViewController.swift
//  Surfie
//
//  Created by Mahadev on 02/07/21.
//

import UIKit

class ExpertProfileViewController: UIViewController, HeaderViewDelegate, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    //MARK:- IB Outlets -
    
    @IBOutlet var segmentedControl: CustomSegmentedControl!
    @IBOutlet var lblExpert: UILabel!
    @IBOutlet var imgExpert: UIImageView!
    @IBOutlet var lblRating: UILabel!
    @IBOutlet var lblRatingNo: UILabel!
    @IBOutlet var vwRating: CosmosView!
    @IBOutlet var headerView : HeaderView!
    
    //MARK: - [ Property ] -
    
    private var pageController: UIPageViewController!
    private var arrVC:[UIViewController] = []
    private var currentPage: Int!
    
    lazy var firstVC : UIViewController = {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIds.Profile) else {
            return UIViewController()
        }
        return vc
    }()
    
    lazy var secondVC : UIViewController = {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIds.Reviews) else {
            return UIViewController()
        }
        return vc
    } ()
    
    //MARK: - [ View Life Cycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpOnLoad()
        configureSegmentControl()
        createPageViewController()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //MARK: - [ Class Helper ] -
    func setUpOnLoad() {
        currentPage = 0
        headerView.lblTitle.isHidden = true
        headerView.delegate = self
    }
    
    func configureSegmentControl() {
        segmentedControl.setTitle("PROFILE".local, forSegmentAt: 0)
        segmentedControl.setTitle("REVIEWS".local, forSegmentAt: 1)
        segmentedControl.addTarget(self, action: #selector(onChangeOfSegment(_:)), for: .valueChanged)
        arrVC.append(firstVC)
        arrVC.append(secondVC)
    }
    
    private func createPageViewController() {
        
        pageController = UIPageViewController.init(transitionStyle: UIPageViewController.TransitionStyle.scroll, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal, options: nil)
        
        pageController.view.backgroundColor = UIColor.clear
        pageController.delegate = nil
        pageController.dataSource = nil
        
        for svScroll in pageController.view.subviews as! [UIScrollView] {
            svScroll.delegate = nil
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let yAxis = self.segmentedControl.frame.maxY
            self.pageController.view.frame = CGRect(x: 0, y: yAxis, width: Screen.Width, height: Screen.Height-yAxis)
        }
        pageController.setViewControllers([firstVC], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
        self.addChild(pageController)
        self.view.addSubview(pageController.view)
        pageController.didMove(toParent: self)
    }
    
    private func indexofviewController(viewCOntroller: UIViewController) -> Int {
        if(arrVC .contains(viewCOntroller)) {
            return arrVC.firstIndex(of: viewCOntroller)!
        }
        return -1
    }
    
    //MARK: - Pagination Delegates -
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = indexofviewController(viewCOntroller: viewController)
        if(index != -1) {
            index = index - 1
        }
        if(index < 0) {
            return nil
        } else {
            return arrVC[index]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = indexofviewController(viewCOntroller: viewController)
        if(index != -1) {
            index = index + 1
        }
        if(index >= arrVC.count) {
            return nil
        } else {
            return arrVC[index]
        }
    }
    
    //MARK: -[Selector]-
    func leftBarButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func onChangeOfSegment(_ sender: CustomSegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            pageController.setViewControllers([arrVC[0]], direction: UIPageViewController.NavigationDirection.reverse, animated: false, completion: nil)
            currentPage = 0
        case 1:
            let direction = currentPage > 1 ? UIPageViewController.NavigationDirection.reverse : UIPageViewController.NavigationDirection.forward
            pageController.setViewControllers([arrVC[1]], direction: direction, animated: false, completion: nil)
            currentPage = 1
        default:
            break
        }
    }
}
