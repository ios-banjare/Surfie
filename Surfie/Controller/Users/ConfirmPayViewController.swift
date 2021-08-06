//
//  ConfirmPayViewController.swift
//  Surfie
//
//  Created by Apple on 28/07/21.
//

import UIKit
import FSCalendar

class ConfirmPayViewController: UIViewController, HeaderViewDelegate {
    
    //MARK: - [ UILabel Outlets] -
    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var lblSubName : UILabel!
    @IBOutlet weak var lblRating : UILabel!
    @IBOutlet weak var lblReviewNo : UILabel!
    @IBOutlet weak var lblStartDate : UILabel!
    @IBOutlet weak var lblEndDate : UILabel!
    @IBOutlet weak var lblCards : UILabel!
    @IBOutlet weak var lblNights : UILabel!
    @IBOutlet weak var lblTax : UILabel!
    @IBOutlet weak var lblNightPrice : UILabel!
    @IBOutlet weak var lblTotalPrice : UILabel!
    @IBOutlet weak var lblTaxPrice : UILabel!
    @IBOutlet weak var fsCalander : FSCalendar!

    
    //MARK: - [ IBOutlets & Properties] -
    @IBOutlet weak var vwCalender : UIView!
    @IBOutlet weak var headerView : HeaderView!
    @IBOutlet weak var btnConfirm : UIButton!
    @IBOutlet weak var btnCoupon : UIButton!
    @IBOutlet weak var imgUser : UIImageView!
    @IBOutlet weak var tblCards : UITableView!
    @IBOutlet weak var tblHeight : NSLayoutConstraint!
    
    //MARK: - [Property] -
    private var firstDate: Date?
    private var lastDate: Date?
    private var dateRange: [Date]?

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
        
        fsCalander.allowsMultipleSelection = true
    
    }

    func setLocalizedText() {
        lblCards.text = "CARDS".local.capitalized
        btnConfirm.setTitle("CONFIRM".local.uppercased(), for: .normal)
        btnCoupon.setTitle("APPLY_COUPON".local, for: .normal)
        headerView.lblTitle.text = "CONFIRM_PAY".local
        
        lblNights.text = "63€" + StaticText.Space + "*" + StaticText.Space + "3" + StaticText.Space + "NIGHTS".local
        lblTax.text = "SERVICE_CHARGE".local
    }
    
    //MARK: - [ Selector Method ] -
    
    func leftBarButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func btnConfirmClicked(sender: UIButton) {
        
    }
    
    @IBAction func applyCouponTapped(sender: UIButton) {
        
    }
    
    @IBAction func startDateTapped(sender: UIButton) {
        vwCalender.isHidden = false
    }
    
    @IBAction func endDateTapped(sender: UIButton) {
        vwCalender.isHidden = false
    }
    
    @IBAction func btnDetailClicked(sender: UIButton) {
        
    }
    
    @IBAction func btnResetDate(sender: UIButton) {
        vwCalender.isHidden = true
    }
    
    @IBAction func btnConfirmDate(sender: UIButton) {
        vwCalender.isHidden = true
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

extension ConfirmPayViewController: UITableViewDataSource, UITableViewDelegate {

    //Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellIds.DefaultTableCell, for: indexPath) as? DefaultTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }

}

extension ConfirmPayViewController: FSCalendarDelegate {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        // nothing selected:
        if firstDate == nil {
            firstDate = date
            dateRange = [firstDate!]
            print("datesRange contains: \(dateRange!)")
            return
        }
        // only first date is selected:
        if firstDate != nil && lastDate == nil {
            // handle the case of if the last date is less than the first date:
            if date <= firstDate! {
                calendar.deselect(firstDate!)
                firstDate = date
                dateRange = [firstDate!]
                print("datesRange contains: \(dateRange!)")
                return
            }
            let range = self.datesRange(from: firstDate!, to: date)
            lastDate = range.last
            for d in range {
                calendar.select(d)
            }
            dateRange = range
            print("datesRange contains: \(dateRange!)")
            return
        }
        // both are selected:
        if firstDate != nil && lastDate != nil {
            for d in calendar.selectedDates {
                calendar.deselect(d)
            }
            lastDate = nil
            firstDate = nil
            dateRange = []
            print("datesRange contains: \(dateRange!)")
        }
    }

    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        // both are selected:
        // NOTE: the is a REDUANDENT CODE:
        if firstDate != nil && lastDate != nil {
            for d in calendar.selectedDates {
                calendar.deselect(d)
            }
            lastDate = nil
            firstDate = nil
            dateRange = []
            print("datesRange contains: \(dateRange!)")
        }
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {

      //  let dateString : String = dateFormatter1.string(from:date)
        if ((self.dateRange?.contains(date)) != nil) {
            return .white
        } else {
            return nil
        }
    }
    
    func datesRange(from: Date, to: Date) -> [Date] {
        // in case of the "from" date is more than "to" date,
        // it should returns an empty array:
        if from > to { return [Date]() }

        var tempDate = from
        var array = [tempDate]

        while tempDate < to {
            tempDate = Calendar.current.date(byAdding: .day, value: 1, to: tempDate)!
            array.append(tempDate)
        }

        return array
    }
    
}

