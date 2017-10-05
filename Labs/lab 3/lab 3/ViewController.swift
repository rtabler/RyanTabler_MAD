//
//  ViewController.swift
//  lab 3
//
//  Created by Ryan Tabler on 10/2/17.
//  Copyright © 2017 Ryan Tabler. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

   @IBOutlet weak var text_outlet_a: UITextField!
   @IBOutlet weak var text_outlet_b: UITextField!
   @IBOutlet weak var text_outlet_c: UITextField!
   
   @IBOutlet weak var x1_label: UILabel!
   @IBOutlet weak var x2_label: UILabel!
   
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
      return true
   }
   
   func recalculate() {
      print("hello")
      return
//      do {
//         if text_outlet_a.text == "" {
//            print("Blank")
//         }
//         let mytext:String = try text_outlet_a.text!
//         let myfloat:Float = try Float(mytext)!
//         try Float(try text_outlet_a.text!)
//         try Float(text_outlet_b.text!)
//         try Float(text_outlet_c.text!)
//      } catch {
//         let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
//      }
   }

   func textFieldDidEndEditing(_ textField: UITextField) {
      recalculate()
   }

   override func viewDidLoad() {
      text_outlet_a.delegate = self
      text_outlet_b.delegate = self
      text_outlet_c.delegate = self
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }


}

