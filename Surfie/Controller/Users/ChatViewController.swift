//
//  ChatViewController.swift
//  Surfie
//
//  Created by Apple on 30/07/21.
//

import UIKit

class ChatViewController: UIViewController, HeaderViewDelegate {

    //MARK: - [ IBOutlets & Properties] -
    
    @IBOutlet weak var tblChat : UITableView!
    @IBOutlet weak var headerView : HeaderView!
    @IBOutlet weak var txtMessage : UITextView!
    @IBOutlet weak var bottomSpace : NSLayoutConstraint!
    @IBOutlet weak var vwSectionHeader : UIView!
    @IBOutlet weak var lblHeader : UILabel!
    @IBOutlet weak var lblSubHeader : UILabel!


    //MARK: - [ ViewLifeCycle ] -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpOnLoad()
        self.addKeyboardObserver()
    }

    func setUpOnLoad() {
        headerView.delegate = self
        headerView.lblTitle.text = "Chat"
        tblChat.registerXib(nibName: CustomCellIds.SenderChatCell)
        tblChat.registerXib(nibName: CustomCellIds.RecieverChatCell)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        IQKeyboardManager.shared.enable = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        IQKeyboardManager.shared.enable = true
        self.view.endEditing(true)
        NotificationCenter.default.removeObserver(self)
    }

    //MARK: - [ Selector Method ] -
    
    func leftBarButtonClicked() {
        self.slideMenuController()?.openLeft()
    }
    
    @IBAction func sendButtonClicked(_ sender: UIButton) {
        
    }
}


// MARK: - [ Table Delegate/DataSource ] -

extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
 
    //Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return vwSectionHeader
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    // DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let strId = indexPath.row%2 == 0 ? CustomCellIds.SenderChatCell : CustomCellIds.RecieverChatCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: strId, for: indexPath) as? ChatTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}


extension ChatViewController: UITextViewDelegate {
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        textView.text = ""
        textView.textColor = .black
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        if textView.text.count == 0 {
            textView.text = "Type Your message"
            textView.textColor = .darkGray
            textView.resignFirstResponder()
        }
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        
        if textView.text.count == 0 {
            textView.text = " Type Your message"
            textView.textColor = .darkGray
            textView.resignFirstResponder()
        }
        return true
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        if (range.location == 0 && (newText == " ")) || (range.location == 0 && newText == "\n") {
            return false
        }
        let numLines = round(textView.contentSize.height / textView.font!.lineHeight)
        if numLines > 5 {
            textView.isScrollEnabled = true
        } else {
            textView.isScrollEnabled = false
        }
        return true
    }
}


extension ChatViewController {
    
    func addKeyboardObserver() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)!.cgRectValue
        if notification.name == UIResponder.keyboardWillHideNotification {
            UIView.animate(withDuration: 0.8) {
                self.bottomSpace.constant = 0
            }
        } else {
            UIView.animate(withDuration: 0.8) {
                if Screen.Height > 736 {
                    self.bottomSpace.constant = keyboardScreenEndFrame.height - 40
                } else {
                    self.bottomSpace.constant = keyboardScreenEndFrame.height
                }
            }
        }
    }
}
