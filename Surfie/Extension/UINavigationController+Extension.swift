//
//  UINavigationController+Extension.swift
//  Surfie
//
//  Created by Mahadev on 25/06/21.
//  Copyright © 2021 Chauhan. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    open override var childForStatusBarHidden: UIViewController? {
        return self.topViewController
    }

    open override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
}
