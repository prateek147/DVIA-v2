//
//  SideMenuViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 22/11/17.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//

import UIKit

protocol SideMenuViewControllerDelegate: class {
    func menuItemControllerDelegate(vc: SideMenuViewController, item: MenuCellItem)
}

class SideMenuViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    weak var delegate: SideMenuViewControllerDelegate?
    
    var menuItems: [MenuItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
        
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let items = MenuItem(
            cellModels: [
                MenuCellModel(item: .home),
                MenuCellModel(item: .insecureDataStorage),
                MenuCellModel(item: .jailbreakDetection),
                MenuCellModel(item: .excessivePermissions),
                MenuCellModel(item: .privateAPIs),
                MenuCellModel(item: .runtimeManipulation),
                MenuCellModel(item: .sideChannelDataLeakage),
                MenuCellModel(item: .securityDecisonsViaUntrustedInput),
                MenuCellModel(item: .brokenCryptography),
                MenuCellModel(item: .clientSideInjection),
                MenuCellModel(item: .transportLayerProtection),
                MenuCellModel(item: .applicationPatching),
                MenuCellModel(item: .sensitiveInformation),
                MenuCellModel(item: .attackingThirdPartyLibraries)
                ]
        )
        
        menuItems = [items]
    }

}

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems[section].cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = menuItems[indexPath.section].cellModels[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! SideMenuTableViewCell
        cell.configure(cellModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cellModel = menuItems[indexPath.section].cellModels[indexPath.item] as? MenuCellModel else { return }
        delegate?.menuItemControllerDelegate(vc: self, item: cellModel.item)
    }
}
