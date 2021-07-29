//
//  CardsViewController.swift
//  Surfie
//
//  Created by Apple on 19/07/21.
//

import UIKit

class CardsViewController: UIViewController, HeaderViewDelegate {

    //MARK: - [ IBOutlets & Properties] -
    
    @IBOutlet weak var headerView : HeaderView!
    @IBOutlet weak var btnAddCard : UIButton!
    @IBOutlet weak var lblCards : UILabel!
    @IBOutlet weak var tblCards : UITableView!
    @IBOutlet weak var tblHeight : NSLayoutConstraint!

    //MARK: - [ ViewLifeCycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpOnLoad()
        self.setLocalizedText()
    }
    
    func setUpOnLoad() {
        tblCards.registerXib(nibName: CustomCellIds.DefaultTableCell)
        headerView.delegate = self
        tblCards.addObserver(self, forKeyPath: StaticText.ContentSize, options: .new, context: nil)
    }

    func setLocalizedText() {
        lblCards.text = "CARDS".local.uppercased()
        btnAddCard.setTitle("ADD_CARD".local, for: .normal)
        headerView.lblTitle.text = "Payments".local
    }
    
    //MARK: - [ Selector Method ] -
    
    func leftBarButtonClicked() {
        self.slideMenuController()?.openLeft()
    }

    @IBAction func addCardnClicked(sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIds.AddCardVC) else {
            return
        }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    //MARK: - [ KVO Methods ] --

    deinit {
        if tblCards != nil {
            self.tblCards.removeObserver(self, forKeyPath: StaticText.ContentSize)
        }
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let obj = object as? UITableView {

            if obj == tblCards && keyPath == StaticText.ContentSize {

                if (change?[NSKeyValueChangeKey.newKey] as? CGSize) != nil {
                    let newHeight = ((change?[NSKeyValueChangeKey.newKey] as? CGSize)?.height)!
                    let otherHeight = Screen.Height - (290 + self.view.safeAreaTop + self.view.safeAreaBottom)
                    if newHeight > otherHeight {
                        tblCards.isScrollEnabled = true
                        tblHeight.constant = otherHeight
                    } else {
                        tblCards.isScrollEnabled = false
                        tblHeight.constant = newHeight
                    }
                    
                }
            }
        }
    }
    
}


// MARK: - [ Table Delegate/DataSource ] -

extension CardsViewController: UITableViewDataSource, UITableViewDelegate {

    //Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellIds.DefaultTableCell, for: indexPath) as? DefaultTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }

}
