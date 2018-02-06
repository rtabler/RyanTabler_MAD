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

   
   @IBAction func textFieldDidEndEditing(_ sender: UITextField) {
      sender.resignFirstResponder()
      recalculate()
      // Future ideas: have the first responder jump to the next field upon hitting "return"
   }
   
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
      return true
   }
   
   func recalculate() {
      // This function calculates the solution and updates the results field
      
      var text_a:String = text_outlet_a.text!
      var text_b:String = text_outlet_b.text!
      var text_c:String = text_outlet_c.text!
      
      // If no text is entered, treat them as "0" (which is the placeholder text)
      if text_a == "" {
         text_a = "0"
      }
      if text_b == "" {
         text_b = "0"
      }
      if text_c == "" {
         text_c = "0"
      }
      
      // I'm probably not using optionals correctly...
      let num_a_opt:Float? = Float(text_a)
      let num_b_opt:Float? = Float(text_b)
      let num_c_opt:Float? = Float(text_c)
      
      // Vars to store solutions
      var x0:Float = Float.nan
      var x1:Float = Float.nan
      
      // Verify input
      if num_a_opt == nil || num_b_opt == nil || num_c_opt == nil {
         // They didn't enter numbers
         let alert = UIAlertController(title: "Invalid Input", message: "We could not solve that equation. Please make sure that you enter a valid decimal number in each field.", preferredStyle: UIAlertControllerStyle.alert)
         alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
         present(alert, animated: true, completion: nil)
         x0 = Float.nan
         x1 = Float.nan
      } else {
         let num_a = num_a_opt!
         let num_b = num_b_opt!
         let num_c = num_c_opt!

         // Calculate quadratic formula
         if num_b*num_b - 4*num_a*num_c < 0 {
            // Solution includes imaginary numbers
            let alert = UIAlertController(title: "Imaginary Numbers Involved", message: "Sorry, we do not yet support imaginary solutions to the quadratic equation!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true, completion: nil)
         } else {
            // Do the math!
            x0 = ( -num_b + sqrtf(num_b*num_b - 4*num_a*num_c) ) / ( 2*num_a )
            x1 = ( -num_b - sqrtf(num_b*num_b - 4*num_a*num_c) ) / ( 2*num_a )
            // To-do: raise alert on divide-by-zero error
         }
      }
      
      // Display solutions
      if !x0.isNaN {
         x1_label.text = String(x0)
      } else {
         x1_label.text = " "
      }
      if !x1.isNaN {
         x2_label.text = String(x1)
      } else {
         x2_label.text = " "
      }
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


   @IBAction func onTapGestureRecognized(_ sender: UITapGestureRecognizer) {
      text_outlet_a.resignFirstResponder()
      text_outlet_b.resignFirstResponder()
      text_outlet_c.resignFirstResponder()
      recalculate()
   }
}

