//
//  ViewController.swift
//  Lab1
//
//  Created by Ryan Tabler on 9/13/17.
//  Copyright © 2017 Ryan Tabler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   @IBOutlet weak var BirdPhoto: UIImageView!
   @IBOutlet weak var BinomialName: UILabel!
   
   @IBAction func WesternButton(_ sender: UIButton) {
      if sender.tag == 0 {
         BirdPhoto.image = UIImage(named: "WesternKingbird.jpg")
         BinomialName.text = "tyrannus verticalis"
      } else if sender.tag == 1 {
         BirdPhoto.image = UIImage(named: "EasternKingbird.jpg")
         BinomialName.text = "tyrannus tyrannus"
      }
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }


}

