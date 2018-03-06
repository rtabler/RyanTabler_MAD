//
//  DetailViewController.swift
//  lab 4
//
//  Created by Ryan Tabler on 3/6/18.
//  Copyright © 2018 Ryan Tabler. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate {
   
   @IBOutlet weak var webView: WKWebView!
   
   var detailItem: String?
   
   func configureView() {
      // Update the user interface for the detail item.
      if let url = detailItem {
         if url != "null" {
            loadWebPage(url)
         }
      }
   }
   func loadWebPage(_ urlString: String){
      //the urlString should be a propery formed url
      //creates a URL object
      let myurl = URL(string: urlString)
      //create a URLRequest object
      let request = URLRequest(url: myurl!)
      //load the URLRequest object in our web view
      webView.load(request)
   }
   
   //WKNavigationDelegate method that is called when a web page begins to load
   func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
   }
   //WKNavigationDelegate method that is called when a web page loads successfully
   func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
   }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        self.configureView()
      print("DetailView loaded")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
