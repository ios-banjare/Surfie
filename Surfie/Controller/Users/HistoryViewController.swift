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
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIds.RentHistoryVC) else {
            return UIViewController()
        }
        return vc
    }()
    
    lazy var secondVC: UIViewController = {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIds.VehicleHistoryVC) else {
            return UIViewController()
        }
        return vc
    }()
    
    lazy var thirdVC: UIViewController = {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIds.ExperienceHistoryVC) else {
            return UIViewController()
        }
        return vc
    }()
    
    //MARK: - [ View Life Cycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.delegate = self
        headerView.lblTitle.text = "HISTORY".local
        currentPage = 0
        configureSegmentControl()
        createPageViewController()
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
            pageController.setViewControllers([arrVC[0]], direction: UIPageViewController.NavigationDirection.reverse, animated: false, completion: nil)
            currentPage = 0
        case 1:
            let direction = currentPage > 1 ? UIPageViewController.NavigationDirection.reverse : UIPageViewController.NavigationDirection.forward
            pageController.setViewControllers([arrVC[1]], direction: direction, animated: false, completion: nil)
            currentPage = 1
        case 2:
            pageController.setViewControllers([arrVC[2]], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
            currentPage = 2
        default:
            break
        }
    }
    
    func leftBarButtonClicked() {
        self.slideMenuController()?.openLeft()
    }

    //MARK: - CreatePagination -
    
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
    
    
}
