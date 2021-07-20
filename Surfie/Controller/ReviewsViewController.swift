//
//  ReviewsViewController.swift
//  Surfie
//
//  Created by Mahadev on 04/07/21.
//

import UIKit

class ReviewsViewController: UIViewController {
    
    //MARK: - [ IBOutlets & Properties] -
    
    @IBOutlet weak var tblReviews : UITableView!
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblReviews : UILabel!
    @IBOutlet weak var vwRating : CosmosView!

    //MARK: - [ ViewLifeCycle Title] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpOnLoad()
    }

    func setUpOnLoad() {
        tblReviews.registerXib(nibName: CustomCellIds.ReviewsTableCell)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}

// MARK: - [ Table Delegate/DataSource ] -

extension ReviewsViewController: UITableViewDataSource, UITableViewDelegate {
 
    //Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellIds.ReviewsTableCell, for: indexPath) as? ReviewsTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
