//
//  ViewController.swift
//  MimiDemo
//
//  Created by kangkang on 2017/5/10.
//  Copyright © 2017年 kangkang. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    let webSite = "file:///Users/wangkang/Downloads/%E5%8A%A0%E8%8F%B2%E7%8C%AB%E6%BC%AB%E7%94%BB-1978.pdf"
    
    override func loadView() {
        webView = WKWebView()
        
        webView.navigationDelegate = self
        view = webView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        webView = WKWebView()
//        webView.navigationDelegate = self
//        view = webView
        
        let url = NSURL(string: webSite)!
        webView.load(URLRequest(url: url as URL))
        webView.allowsBackForwardNavigationGestures = true

        
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "1978"
//     self.view.backgroundColor = UIColor.green
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        title = webView.title
//    }

}

