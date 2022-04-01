//
//  Choice.swift
//  animate_test
//
//  Created by Thibault Buze on 06/02/2019.
//  Copyright © 2019 Thibault Buze. All rights reserved.
//

import UIKit

class Choice: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0: return 2
        case 1: return 1
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt AtindexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "basic")
        
        if AtindexPath.section == 0{
            if AtindexPath.row == 0{
                cell.textLabel?.text = "Contact us"
            }else{
                cell.textLabel?.text = "Visit our website"
            }
        }else{
            cell.textLabel?.text = "Get more informations"
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0: return "Informations"
        case 1: return "Help"
        default: return ""
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section{
        case 0: print("First section clicked")
        case 1: print("Second section clicked")
        default: break
        }
    }
    
}

