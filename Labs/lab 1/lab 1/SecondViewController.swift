//
//  SecondViewController.swift
//  lab 1
//
//  Created by Ryan Tabler on 2/6/18.
//  Copyright © 2018 Ryan Tabler. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

   @IBOutlet weak var loadingLabel: UILabel!
   
   @IBOutlet weak var reloadButton: UIButton!
   @IBAction func reopenApp(_ sender: UIButton) {
      UIApplication.shared.open(URL(string: "https://youtu.be/dQw4w9WgXcQ")!)
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
   }
   
   override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
//      UIApplication.shared.open(URL(string: "https://creative.colorado.edu")!)
      UIApplication.shared.open(URL(string: "https://youtu.be/dQw4w9WgXcQ")!)
      loadingLabel.text = "There!"
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }


}

