//
//  ViewController.swift
//  Atrapos.iOS
//
//  Created by Yury Martynov on 18/12/2016.
//  Copyright © 2016 Yury Martynov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL (string: "https://yuri-martynov.github.io/baloon/");
        let request = NSURLRequest(url: url! as URL);
        webView.scrollView.bounces = false
        webView.loadRequest(request as URLRequest);
        
        let rightSwipe = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(self.handleSwipes));
        rightSwipe.edges = .left;
        view.addGestureRecognizer(rightSwipe);
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.state ==  .ended && webView.canGoBack) {
            webView.goBack()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

