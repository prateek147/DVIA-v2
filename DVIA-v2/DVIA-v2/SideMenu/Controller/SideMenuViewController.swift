//
//  SideMenuViewController.swift
//  DVIA - Damn Vulnerable iOS App (damnvulnerableiosapp.com)
//  Created by Prateek Gianchandani on 22/11/17.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//  You are free to use this app for commercial or non-commercial purposes
//  You are also allowed to use this in trainings
//  However, if you benefit from this project and want to make a contribution, please consider making a donation to The Juniper Fund (www.thejuniperfund.org/)
//  The Juniper fund is focusing on Nepali workers involved with climbing and expedition support in the high mountains of Nepal. When a high altitude worker has an accident (death or debilitating injury), the impact to the family is huge. The juniper fund provides funds to the affected families and help them set up a sustainable business.
//  For more information,  visit www.thejuniperfund.org
//  Or watch this video https://www.youtube.com/watch?v=HsV6jaA5J2I
//  And this https://www.youtube.com/watch?v=6dHXcoF590E
 

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
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "slider-bg.png")
        self.view.insertSubview(backgroundImage, at: 0)
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderHeight = 30
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        let items = MenuItem(
            cellModels: [
                MenuCellModel(item: .home),
                MenuCellModel(item: .insecureDataStorage),
                MenuCellModel(item: .jailbreakDetection),
                MenuCellModel(item: .excessivePermissions),
                MenuCellModel(item: .runtimeManipulation),
                MenuCellModel(item: .antiAntiHookingDebugging),
                MenuCellModel(item: .binaryProtection),
                MenuCellModel(item: .touchIDBypass),
                MenuCellModel(item: .phishing),
                MenuCellModel(item: .sideChannelDataLeakage),
                MenuCellModel(item: .securityDecisonsViaUntrustedInput),
                MenuCellModel(item: .brokenCryptography),
                MenuCellModel(item: .clientSideInjection),
                MenuCellModel(item: .transportLayerProtection),
                MenuCellModel(item: .applicationPatching),
                MenuCellModel(item: .sensitiveInformation),
            MenuCellModel(item: .attackingThirdPartyLibraries),
                MenuCellModel(item: .donate)
                ]
        )
        menuItems = [items]
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = UIColor.clear
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 20))
        label.text = "DAMNVULNERABLEIOSAPP.COM"
        label.font = label.font.withSize(14)
        label.textColor = UIColor(red: 109/255, green: 109/255, blue: 113/255, alpha: 1.0)
        view.addSubview(label)
        view.frame.size = CGSize(width:tableView.frame.width, height: 20.0)
        tableView.tableHeaderView = view;
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
