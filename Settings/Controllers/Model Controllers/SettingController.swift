//
//  SettingController.swift
//  Settings
//
//  Created by Darin Marcus Armstrong on 6/17/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import Foundation

class SettingController {
    
    static let sharedInstance = SettingController()
    
    let settings: [Setting] = {
        let music = Setting(name: "iTunes", icon: #imageLiteral(resourceName: "itunes"), isOn: false)
        let appStore = Setting(name: "App Store", icon: #imageLiteral(resourceName: "appstore"), isOn: false)
        let iBooks = Setting(name: "iBooks", icon: #imageLiteral(resourceName: "ibooks"), isOn: true)
        
        return[music, appStore, iBooks]
    }()
    
    func toggleIsOn(for setting: Setting) {
        setting.isOn = !setting.isOn
    }
}
