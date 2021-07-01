//
//  ExperiencesViewController.swift
//  Surfie
//
//  Created by Mahadev on 29/06/21.
//

import UIKit

class ExperiencesViewController: UIViewController, SecondaryHeaderViewDelegate {
    
    
    //MARK: - [ IBOutlets & Properties] -
    
    @IBOutlet weak var headerView : SecondaryHeaderView!

    //MARK: - [ ViewLifeCycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        headerView.delegate = self
    }
    

    //MARK: - [ Selector Method ] -
    
    func leftMenuButtonClicked() {
        DPrint("Open menu")
        self.slideMenuController()?.openLeft()
    }

}
