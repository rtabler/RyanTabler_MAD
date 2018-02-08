//
//  SecondViewController.swift
//  lab 1
//
//  Created by Ryan Tabler on 2/6/18.
//  Copyright © 2018 Ryan Tabler. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      
   }
   
   override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      UIApplication.shared.open(URL(string: "https://creative.colorado.edu")!)
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }


}

