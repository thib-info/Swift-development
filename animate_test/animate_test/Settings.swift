//
//  Settings.swift
//  animate_test
//
//  Created by Thibault Buze on 02/02/2019.
//  Copyright © 2019 Thibault Buze. All rights reserved.
//

import UIKit

class Settings : UIViewController {
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    var value: String!
    var stepperPress: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let EdgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(backToHome))
        EdgePan.edges = .left
        self.view.addGestureRecognizer(EdgePan)
        
        label1.text = value
        label2.text = stepperPress
    }
    
    @objc func backToHome (sender: UIScreenEdgePanGestureRecognizer){
        if sender.state == .recognized{
            let main = UIStoryboard(name: "Main", bundle: nil)
            let homePage = main.instantiateViewController(withIdentifier: "Main") as! HomePage
            homePage.text = value
            self.present(homePage, animated: true, completion: nil)
            print("Operation is a success")
        }
    }
    
}
