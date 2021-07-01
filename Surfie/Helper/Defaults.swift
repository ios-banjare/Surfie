//
//  Defaults.swift
//  Toyota-Tsusho
//
//  Created by Encora on 19/10/20.
//  Copyright © 2020 Encora. All rights reserved.
//

import Foundation

enum DefaultKeys: String {
    case selectedTab
    case isDarkMode
    case isSystemDarkMode
    case AppTheme
}

enum TabNames: String {
    case rent, vehicles, experience
}


class Defaults {

    /**
     Call this function to clear user default
     */
    static func clear() {
        if let defaultsName = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: defaultsName)
        }
    }
    
    /**
     Call this function to clear any particular value from user default
     */
    static func removeValueFor(key: DefaultKeys) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
    
    /**
     Call this function to add any particular value in user default
     */
    static func setValueFor(key: DefaultKeys, value: Any?) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    /**
     Call this function to get value from user default for any particular key
     */
    static func valueFor(key: DefaultKeys) -> Any? {
        let value = UserDefaults.standard.value(forKey: key.rawValue)
        return value
    }
    
    /**
     Call this function to get bool from user default for any particular key
     */
    static func boolFor(key: DefaultKeys) -> Bool {
        return UserDefaults.standard.bool(forKey: key.rawValue)
    }
    
}
