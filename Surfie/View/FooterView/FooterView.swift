//
//  OTPViewController.swift
//  Surfie
//
//  Created by Mahadev on 28/06/21.
//  Copyright © 2021 Chauhan. All rights reserved.

import UIKit

class FooterView: UIView {

    
    @IBOutlet var contentView: UIView!
    //labels
    @IBOutlet weak var lblRent: UILabel!
    @IBOutlet weak var lblVehicle: UILabel!
    @IBOutlet weak var lblExperience: UILabel!
    //images
    @IBOutlet weak var rentImage: UIImageView!
    @IBOutlet weak var vehicleImage: UIImageView!
    @IBOutlet weak var experienceImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit()
    {
        Bundle.main.loadNibNamed(ViewNames.footer, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        
        rentImage.image = rentImage.image!.withRenderingMode(.alwaysTemplate)
        vehicleImage.image = vehicleImage.image!.withRenderingMode(.alwaysTemplate)
        experienceImage.image = experienceImage.image!.withRenderingMode(.alwaysTemplate)
       
        lblRent.text = "RENT".local
        lblVehicle.text = "VEHICLES".local
        lblExperience.text = "EXPERIENCE".local
        
        guard let selectedTab =  Defaults.valueFor(key: .selectedTab) as? String else {
            return
        }
        
        if(selectedTab == TabNames.rent.rawValue)
        {
            rentImage.tintColor = UIColor.white
            lblRent.textColor = UIColor.white
            vehicleImage.tintColor = UIColor.white.withAlphaComponent(0.5)
            lblVehicle.textColor = UIColor.white.withAlphaComponent(0.5)
            experienceImage.tintColor = UIColor.white.withAlphaComponent(0.5)
            lblExperience.textColor = UIColor.white.withAlphaComponent(0.5)
            
        }
        else if(selectedTab == TabNames.vehicles.rawValue)
        {
            rentImage.tintColor = UIColor.white.withAlphaComponent(0.5)
            lblRent.textColor = UIColor.white.withAlphaComponent(0.5)
            vehicleImage.tintColor = UIColor.white
            lblVehicle.textColor = UIColor.white
            experienceImage.tintColor = UIColor.white.withAlphaComponent(0.5)
            lblExperience.textColor = UIColor.white.withAlphaComponent(0.5)
        }
        else if(selectedTab == TabNames.experience.rawValue)
        {
            rentImage.tintColor = UIColor.white.withAlphaComponent(0.5)
            lblRent.textColor = UIColor.white.withAlphaComponent(0.5)
            vehicleImage.tintColor = UIColor.white.withAlphaComponent(0.5)
            lblVehicle.textColor = UIColor.white.withAlphaComponent(0.5)
            experienceImage.tintColor = UIColor.white
            lblExperience.textColor = UIColor.white
        }
        
    }

    @IBAction func buttonActn(_ sender: Any) {
        let b = sender as? UIButton
        customButtonPressed(Int(b?.tag ?? 0))
    }
    
    
    func customButtonPressed(_ buttonTag: Int)
    {
        for i in 1..<6 {
            let b = viewWithTag(i) as? UIButton
            if b?.tag == buttonTag {
                if b?.tag == 1
                {
                    Defaults.setValueFor(key: .selectedTab,
                                         value: TabNames.rent.rawValue)
                    Common.instance.rootToSideMenu(
                        controllerBy: StoryboardIds.Home)
                }
                else if b?.tag == 2
                {
                    Defaults.setValueFor(key: .selectedTab,
                                         value: TabNames.vehicles.rawValue)
                    Common.instance.rootToSideMenu(
                        controllerBy: StoryboardIds.Vehicles)
                }
                else if b?.tag == 3
                {
                    Defaults.setValueFor(key: .selectedTab,
                                         value: TabNames.experience.rawValue)
                    Common.instance.rootToSideMenu(
                        controllerBy: StoryboardIds.Experiences)
                }
                
            }
        }
    }
}
