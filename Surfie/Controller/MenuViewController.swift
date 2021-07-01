//
//  MenuViewController.swift
//  Surfie
//
//  Created by Ankush Mahajan on 28/06/21.
//

import UIKit

/*enum LeftMenu: Int {
    case dashboard = 0
    case bookShelf
    case myLibrary
    case profile
    case favorite
}

protocol LeftMenuProtocol : AnyObject {
    func changeViewController(_ menu: LeftMenu)
} */

class MenuViewController: UIViewController { //, LeftMenuProtocol {
    
    // MARK: - Outlets
    @IBOutlet weak var tblMenu: UITableView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var labelSearchMap: UILabel!
    
    // MARK: - Variable
    let arrMenu = ["Home".local,
                   "Payments".local,
                   "Purchases historic".local,
                   "Notifications".local,
                   "Definitions and Profile".local,
                   "Invite friends".local,
                   "Log out".local]
    
    let arrImg = [#imageLiteral(resourceName: "home"), #imageLiteral(resourceName: "mywallet"), #imageLiteral(resourceName: "history"), #imageLiteral(resourceName: "notify"), #imageLiteral(resourceName: "settings"), #imageLiteral(resourceName: "settings"), #imageLiteral(resourceName: "logout")]
    
    var selectedIndex = -1
    static var paymntFlag = 0
    
   /* var dashboardVC: UIViewController!
    var bookShelfVC: UIViewController!
    var myLibraryVC: UIViewController!
    var profileVC: UIViewController!
    var favoriteVC: UIViewController! */

    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetup()
        
        
        
       /* let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let dashboard = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        let nvcD = UINavigationController(rootViewController: dashboard)
        self.dashboardVC = nvcD
        
        let category = storyboard.instantiateViewController(withIdentifier: "CategoryVC") as! CategoryVC
        let nvcC = UINavigationController(rootViewController: category)
        self.bookShelfVC = nvcC
        
        let profile = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        let nvcP = UINavigationController(rootViewController: profile)
        self.profileVC = nvcP
        
        let library = storyboard.instantiateViewController(withIdentifier: "MyLibraryVC") as! MyLibraryVC
        let nvcLib = UINavigationController(rootViewController: library)
        self.myLibraryVC = nvcLib
        
        
        let fav = storyboard.instantiateViewController(withIdentifier: "FavouriteVC") as! FavouriteVC
        let nvcFav = UINavigationController(rootViewController: fav)
        self.favoriteVC = nvcFav
        
        if #available(iOS 11.0, *) {
            tblMenu.contentInsetAdjustmentBehavior = .never
        } */
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       /* if AppCommon.isLoggedIn() {
            
            self.imgProfile.layer.cornerRadius = self.imgProfile.frame.width / 2
            self.imgProfile.clipsToBounds = true
            
            let user = kAppDelegateObj.userData
            let fName = user[userInfo.first_name.rawValue] as? String ?? ""
            let lName = user[userInfo.last_name.rawValue] as? String ?? ""
            self.lblName.text = fName + " " + lName
            
            if  let url:String = UserDefaults.standard.value(forKey: "profile") as? String
            {
                if let catPictureURL = URL(string: url) {
                    self.imgProfile.sd_setImage(with: catPictureURL, placeholderImage: UIImage(named: "dummyProfile"))
                }
            }
            self.btnLogout.setTitle("LogOut", for: .normal)
        } else {
            self.lblName.text = "Login or Sign Up to View More"
            self.imgProfile.image = UIImage(named: "dummyProfile")
            self.btnLogout.setTitle("Login", for: .normal)
        }
        
        
        tblMenu.reloadData() */
    }
    
    // MARK: - Helper -
    
    @IBAction func closeClicked(_ sender: UIButton) {
        self.slideMenuController()?.closeLeft()
    }
    
    @IBAction func logOutClicked(_ sender: UIButton) {
       /* var strM = kGuestUser
        if AppCommon.isLoggedIn() {
           strM = "Are you sure want to logout?"
            
        }
        AppCommon.guestUser(strM) */
    }
    
   /* func changeViewController(_ menu: LeftMenu) {
        switch menu {
        case .dashboard:
            UserDefaults.standard.setValue("home", forKey: "SelectedTab");
            self.slideMenuController()?.changeMainViewController(self.dashboardVC, close: true)
        case .bookShelf:
            UserDefaults.standard.setValue("category", forKey: "SelectedTab");
            self.slideMenuController()?.changeMainViewController(self.bookShelfVC, close: true)
        case .myLibrary:
            UserDefaults.standard.setValue("library", forKey: "SelectedTab");
            self.slideMenuController()?.changeMainViewController(self.myLibraryVC, close: true)
        case .profile:
            UserDefaults.standard.setValue("profile", forKey: "SelectedTab");
            self.slideMenuController()?.changeMainViewController(self.profileVC, close: true)
            
        case .favorite:
            self.slideMenuController()?.changeMainViewController(self.favoriteVC, close: true)
        }
    } */
    
}


extension MenuViewController {
    
    func initialSetup() {
        tblMenu.registerXib(nibName: "MenuTableViewCell")
        labelSearchMap.text = "SURF MAP".local
        lblName.text = "Troy Malta".local
        
    }
    
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        cell.labelTitle.text = arrMenu[indexPath.row]
        cell.imageViewIcon.image = arrImg[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.slideMenuController()?.closeLeft()
       /* selectedIndex = indexPath.row
        tblMenu.reloadData()
        if let menu = LeftMenu(rawValue: indexPath.row) {
            self.changeViewController(menu)
        } */
    }
}
