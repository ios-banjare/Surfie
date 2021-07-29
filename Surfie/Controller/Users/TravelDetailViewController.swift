//
//  TravelDetailViewController.swift
//  Surfie
//
//  Created by Apple on 28/07/21.
//

import UIKit

class TravelDetailViewController: UIViewController, HeaderViewDelegate {
    
    //MARK: - [ IBOutlets & Properties] -
    
    @IBOutlet weak var tblTravel : UITableView!
    @IBOutlet weak var headerView : HeaderView!

    var arrTravel: [String] = []
    
    //MARK: - [ ViewLifeCycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpOnLoad()
    }
    
    func setUpOnLoad() {
        tblTravel.registerXib(nibName: CustomCellIds.HistoryTableCell)
        headerView.delegate = self
        headerView.lblTitle.text = "TRAVEL_DETAIL".local
        arrTravel = ["RESEND_RECEIPT".local, "SERVICE_NOT_HAPPEN".local, "TRIP_CANCEL_FEE".local, "REPORT_ACCIDENT".local, "CONDUCT_DRIVER".local, "I_DAMAGE_EQUIP".local, "ANOTHER_PROBLEM".local, ]
    }
    
    func leftBarButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }

}

// MARK: - [ Table Delegate/DataSource ] -

extension TravelDetailViewController: UITableViewDataSource, UITableViewDelegate {

    //Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTravel.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellIds.HistoryTableCell, for: indexPath) as? HistoryTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellIds.DefaultTableCell, for: indexPath) as? DefaultTableViewCell else {
                return UITableViewCell()
            }
            cell.lblHeading.text = arrTravel[indexPath.row-1]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}


