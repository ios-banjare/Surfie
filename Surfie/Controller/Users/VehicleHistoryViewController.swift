//
//  VehicleHistoryViewController.swift
//  Surfie
//
//  Created by Apple on 21/07/21.
//

import UIKit

class VehicleHistoryViewController: UIViewController {
    
    //MARK: - [ IBOutlets & Properties] -
    
    @IBOutlet weak var tblVehicleHistory : UITableView!

    //MARK: - [ ViewLifeCycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpOnLoad()
    }
    
    func setUpOnLoad() {
        tblVehicleHistory.registerXib(nibName: CustomCellIds.HistoryTableCell)
    }

}

// MARK: - [ Table Delegate/DataSource ] -

extension VehicleHistoryViewController: UITableViewDataSource, UITableViewDelegate {

    //Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellIds.HistoryTableCell, for: indexPath) as? HistoryTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIds.TravelDetailVC) else {
            return
        }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

