//
//  verificacionViewController.swift
//  RUTRUX
//
//  Created by reynaldo peralta marquez on 11/18/21.
//  Copyright © 2021 reynaldo peralta marquez. All rights reserved.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController,MenuControllerDelegate {

    
    private var sideMenu:SideMenuNavigationController?
    
    private let settingsController = SettingsViewController()
    private let infoController = InfoViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let menu = MenuController(with: SideMenuItem.allCases)
        
        menu.delegate = self
        
        sideMenu = SideMenuNavigationController(rootViewController: menu)
    
        sideMenu?.leftSide = true
    
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)

        addChildController()
    }
    
    
    private func addChildController(){
        addChild(settingsController)
        addChild(infoController)
        
        view.addSubview(settingsController.view)
        view.addSubview(infoController.view)
        
        settingsController.view.frame = view.bounds
        infoController.view.frame = view.bounds
        
        settingsController.didMove(toParent: self)
        infoController.didMove(toParent: self)
        
        
        settingsController.view.isHidden = true
        infoController.view.isHidden = true
    }
    
    @IBAction func didTapMenuButton(){
        present(sideMenu!, animated: true)
    }
    
       
    func didSelectMenuItem(name: SideMenuItem) {
        sideMenu?.dismiss(animated: true, completion: nil)
        
        
            title = name.rawValue
                  
            switch name {
            case .home:
                
                settingsController.view.isHidden = true
                infoController.view.isHidden = true
            case .info:
                
                settingsController.view.isHidden = true
                infoController.view.isHidden = false
            case .settings:
                
                settingsController.view.isHidden = false
                infoController.view.isHidden = true
            }

    }
 
  
}


