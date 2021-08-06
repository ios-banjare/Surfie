//
//  VehiclesViewController.swift
//  Surfie
//
//  Created by Mahadev on 29/06/21.
//

import UIKit

class VehiclesViewController: UIViewController, SecondaryHeaderViewDelegate {
    
    
    //MARK: - [ IBOutlets & Properties] -
    
    @IBOutlet weak var tblVehicles : UITableView!
    @IBOutlet weak var headerView : SecondaryHeaderView!

    //MARK: - [ ViewLifeCycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpOnLoad()
    }

    func setUpOnLoad() {
        headerView.delegate = self
        headerView.lblSubTitle.text = "WHAT_U_NEED".local
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    

    //MARK: - [ Selector Method ] -
    
    func leftMenuButtonClicked() {
        DPrint("Open menu")
        self.slideMenuController()?.openLeft()
    }
    
}


// MARK: - [ Table Delegate/DataSource ] -

extension VehiclesViewController: UITableViewDataSource, UITableViewDelegate, VehicleTableCellDelegate {
 
    //Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellIds.VehiclesTableCell, for: indexPath) as? VehiclesTableViewCell else {
            return UITableViewCell()
        }
        cell.oneCell = indexPath.row%2 == 0
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    func itemSelectedAt(index: Int) {
        let storyboardE = UIStoryboard(name: StoryboardNames.Experience.rawValue, bundle: nil)
        guard let nextVC = storyboardE.instantiateViewController(withIdentifier: StoryboardIds.ExperienceDescVC) as? ExperienceDescViewController else {
            return
        }
        nextVC.inForest = index%2 == 0
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
