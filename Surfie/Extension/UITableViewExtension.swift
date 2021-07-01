//
//  UITableViewExtension.swift
//  Surfie
//
//  Created by Ankush Mahajan on 28/06/21.
//

import Foundation

extension UITableView {
    
    func registerXib(nibName: String) {
        register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
}
