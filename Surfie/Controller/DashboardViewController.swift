//
//  DashboardViewController.swift
//  Surfie
//
//  Created by Mahadev on 29/06/21.
//

import UIKit

class DashboardViewController: UIViewController, SecondaryHeaderViewDelegate {
    

    //MARK: - [ IBOutlets & Properties] -
    
    @IBOutlet weak var headerView : SecondaryHeaderView!

    //MARK: - [ ViewLifeCycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        headerView.lblTitle.isHidden = true
        headerView.lblSubTitle.isHidden = true
        headerView.lblSeprator.isHidden = true
        headerView.delegate = self
    }
    

    //MARK: - [ Selector Method ] -
    
    func leftMenuButtonClicked() {
        DPrint("Open menu")
        self.slideMenuController()?.openLeft()
    }

}
