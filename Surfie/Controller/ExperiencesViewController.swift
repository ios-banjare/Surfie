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
    @IBOutlet weak var tblExperience : UITableView!

    //MARK: - [ ViewLifeCycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpOnLoad()
    }
    
    func setUpOnLoad() {
        tblExperience.registerXib(nibName: CustomCellIds.ExperienceTableCell)
        headerView.delegate = self
    }

    //MARK: - [ Selector Method ] -
    
    func leftMenuButtonClicked() {
        self.slideMenuController()?.openLeft()
    }

}


// MARK: - [ Table Delegate/DataSource ] -

extension ExperiencesViewController: UITableViewDataSource, UITableViewDelegate {
 
    //Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellIds.ExperienceTableCell, for: indexPath) as? ExperienceTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
