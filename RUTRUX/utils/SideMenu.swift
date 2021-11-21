//
//  SideMenu.swift
//  RUTRUX
//
//  Created by John Samuel Altamirano Sanchez on 11/20/21.
//  Copyright © 2021 reynaldo peralta marquez. All rights reserved.
//

import Foundation
import UIKit


protocol MenuControllerDelegate {
    
    func didSelectMenuItem(name: SideMenuItem)
    
}


enum SideMenuItem: String, CaseIterable {
    case home = "Home"
    case info = "Info"
    case settings = "Settings"
}

class MenuController: UITableViewController {
    
    public var delegate:MenuControllerDelegate?
    
    private let menuItems:[SideMenuItem]
    private let color = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    
    init(with menuItems: [SideMenuItem]){
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
       
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not bean implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = color
        view.backgroundColor = color
    }
    
    //table
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row].rawValue
        cell.textLabel?.textColor = .white
        cell.backgroundColor = color
        cell.contentView.backgroundColor = color
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //
        
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(name: selectedItem)
    }
}

