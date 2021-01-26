//
//  WebViewController.swift
//  QiitaApp
//
//  Created by 栗須星舞 on 2021/01/26.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var urlString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let webURL = URL(string: urlString) else {
            return
        }
        
        let webRequest = URLRequest(url: webURL)
        
        webView.load(webRequest)
    }
}
