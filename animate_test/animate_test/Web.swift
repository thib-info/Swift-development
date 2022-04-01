//
//  Web.swift
//  animate_test
//
//  Created by Thibault Buze on 09/02/2019.
//  Copyright © 2019 Thibault Buze. All rights reserved.
//

import UIKit

class Web: UIViewController, UISearchBarDelegate, UIWebViewDelegate {
    
    @IBOutlet var WebView: UIWebView!
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        if let text = searchBar.text{
            if let url = NSURL(string: text){
                let reqest = NSURLRequest(url: url as URL)
                WebView.loadRequest(reqest as URLRequest)
            }
        }
    }
}
