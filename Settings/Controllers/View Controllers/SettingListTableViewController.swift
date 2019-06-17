//
//  SettingListTableViewController.swift
//  Settings
//
//  Created by Darin Marcus Armstrong on 6/17/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import UIKit

class SettingListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SettingController.sharedInstance.settings.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as? SettingTableViewCell else {return UITableViewCell()}
        
        // Configure the cell...
        let setting = SettingController.sharedInstance.settings[indexPath.row]
        cell.updateViews(with: setting)
        cell.cellDelegate = self
        return cell
    }
}

extension SettingListTableViewController: SettingCellDelegate {
    func settingSwitchTapped(for cell: SettingTableViewCell) {
        //find the index path of the cell
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        //using that index path - find the setting
        let setting = SettingController.sharedInstance.settings[indexPath.row]
        //toggle the isOn for that setting
        SettingController.sharedInstance.toggleIsOn(for: setting)
        //update the cell views
        cell.updateViews(with: setting)
    }
}
