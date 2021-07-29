//
//  RentHistoryViewController.swift
//  Surfie
//
//  Created by Apple on 21/07/21.
//

import UIKit

class RentHistoryViewController: UIViewController {

    //MARK: - [ IBOutlets & Properties] -
    
    @IBOutlet weak var tblRentHistory : UITableView!

    //MARK: - [ ViewLifeCycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpOnLoad()
    }
    
    func setUpOnLoad() {
        tblRentHistory.registerXib(nibName: CustomCellIds.HistoryTableCell)
    }

}

// MARK: - [ Table Delegate/DataSource ] -

extension RentHistoryViewController: UITableViewDataSource, UITableViewDelegate {

    //Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
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
