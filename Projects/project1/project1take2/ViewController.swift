//
//  ViewController.swift
//  project1take2
//
//  Created by Ryan Tabler on 10/16/17.
//  Copyright © 2017 Ryan Tabler. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

   @IBOutlet var MainView: UIView!
   
   
   // stack views
   @IBOutlet weak var TwoColorsStackView: UIStackView!
   
   // slider constraints
   @IBOutlet weak var Color1RSliderWidthConstraint: NSLayoutConstraint!
   @IBOutlet weak var Color1GSliderWidthConstraint: NSLayoutConstraint!
   @IBOutlet weak var Color1BSliderWidthConstraint: NSLayoutConstraint!
   @IBOutlet weak var Color2RSliderWidthConstraint: NSLayoutConstraint!
   @IBOutlet weak var Color2GSliderWidthConstraint: NSLayoutConstraint!
   @IBOutlet weak var Color2BSliderWidthConstraint: NSLayoutConstraint!
   @IBOutlet weak var MixerSliderWidthConstraint: NSLayoutConstraint!
   
   // slider outlets
   @IBOutlet weak var Color1RSliderOutlet: UISlider!
   @IBOutlet weak var Color1GSliderOutlet: UISlider!
   @IBOutlet weak var Color1BSliderOutlet: UISlider!
   @IBOutlet weak var Color2RSliderOutlet: UISlider!
   @IBOutlet weak var Color2GSliderOutlet: UISlider!
   @IBOutlet weak var Color2BSliderOutlet: UISlider!
   @IBOutlet weak var MixerSliderOutlet: UISlider!
   
   // textbox outlets
   @IBOutlet weak var Color1RTextOutlet: UITextField!
   @IBOutlet weak var Color1GTextOutlet: UITextField!
   @IBOutlet weak var Color1BTextOutlet: UITextField!
   @IBOutlet weak var Color2RTextOutlet: UITextField!
   @IBOutlet weak var Color2GTextOutlet: UITextField!
   @IBOutlet weak var Color2BTextOutlet: UITextField!
   
   // results outlets
   @IBOutlet weak var RGBResultLabel: UILabel!
   @IBOutlet weak var HexResultLabel: UILabel!
   
   // BIG CALCULATION FUNCTION
   func recalculate() {
      let c1r:Float = Float(Color1RTextOutlet.text!)! / 255.0
      let c1g:Float = Float(Color1GTextOutlet.text!)! / 255.0
      let c1b:Float = Float(Color1BTextOutlet.text!)! / 255.0
      let c2r:Float = Float(Color2RTextOutlet.text!)! / 255.0
      let c2g:Float = Float(Color2GTextOutlet.text!)! / 255.0
      let c2b:Float = Float(Color2BTextOutlet.text!)! / 255.0
      
      let c1perc:Float = (1.0 - MixerSliderOutlet.value)
      let c2perc:Float = MixerSliderOutlet.value
      
      let resRfloat:Float = c1perc*c1r + c2perc*c2r
      let resGfloat:Float = c1perc*c1g + c2perc*c2g
      let resBfloat:Float = c1perc*c1b + c2perc*c2b
      
      let resRint:Int = Int(resRfloat*255.0)
      let resGint:Int = Int(resGfloat*255.0)
      let resBint:Int = Int(resBfloat*255.0)
      
      RGBResultLabel.text = "rgb("+String(resRint)+","+String(resGint)+","+String(resBint)+")"
      HexResultLabel.text = ""
   }
   
   // slider actions
   @IBAction func Color1RSliderAction(_ sender: UISlider) {
      Color1RTextOutlet.text = String(Int(sender.value*255.0))
      recalculate()
   }
   @IBAction func Color1GSliderAction(_ sender: UISlider) {
      Color1GTextOutlet.text = String(Int(sender.value*255.0))
      recalculate()
   }
   @IBAction func Color1BSliderAction(_ sender: UISlider) {
      Color1BTextOutlet.text = String(Int(sender.value*255.0))
      recalculate()
   }
   @IBAction func Color2RSliderAction(_ sender: UISlider) {
      Color2RTextOutlet.text = String(Int(sender.value*255.0))
      recalculate()
   }
   @IBAction func Color2GSliderAction(_ sender: UISlider) {
      Color2GTextOutlet.text = String(Int(sender.value*255.0))
      recalculate()
   }
   @IBAction func Color2BSliderAction(_ sender: UISlider) {
      Color2BTextOutlet.text = String(Int(sender.value*255.0))
      recalculate()
   }
   @IBAction func MixerSliderAction(_ sender: UISlider) {
      recalculate()
   }
   
   
   // textbox actions
   func updateFromTextbox(sender:UITextField, settee:UISlider) {
      let numOpt:Int? = Int(sender.text!)
      if numOpt == nil {
         return
      }
      var num = numOpt!
      if num > 255 {
         num = 255
         sender.text = "255"
      } else if num < 0 {
         num = 0
         sender.text = "0"
      }
      settee.value = Float(num) / 255.0
      
   }
   @IBAction func Color1RTextAction(_ sender: UITextField) {
      updateFromTextbox(sender: sender, settee: Color1RSliderOutlet)
      recalculate()
   }
   @IBAction func Color1GTextAction(_ sender: UITextField) {
      updateFromTextbox(sender: sender, settee: Color1GSliderOutlet)
      recalculate()
   }
   @IBAction func Color1BTextAction(_ sender: UITextField) {
      updateFromTextbox(sender: sender, settee: Color1BSliderOutlet)
      recalculate()
   }
   @IBAction func Color2RTextAction(_ sender: UITextField) {
      updateFromTextbox(sender: sender, settee: Color2RSliderOutlet)
      recalculate()
   }
   @IBAction func Color2GTextAction(_ sender: UITextField) {
      updateFromTextbox(sender: sender, settee: Color2GSliderOutlet)
      recalculate()
   }
   @IBAction func Color2BTextAction(_ sender: UITextField) {
      updateFromTextbox(sender: sender, settee: Color2BSliderOutlet)
      recalculate()
   }
   
   
   // layout and orientation calculations
   func setLayout(mode:Int) {
      // Screen,device details
      let screenWidth:CGFloat = UIScreen.main.bounds.width
      print(screenWidth)
      let screenHeight:CGFloat = UIScreen.main.bounds.height
      print(screenHeight)
      let marginWidth:CGFloat = 16.0
      
      // Vars we will set
      var sliderWidth:CGFloat = 100.0
      var mixerSliderWidth:CGFloat = 100.0
      
      if mode == 0 {
         // Portrait
         
         // Set slider widths
         sliderWidth = CGFloat(screenWidth - marginWidth - 16 - (25 + 8 + 8 + 40) - 16 - marginWidth)
         mixerSliderWidth = CGFloat(screenWidth - marginWidth - 16 - (20 + 8 + 8 + 20) - 16 - marginWidth)
         
         // Set stackview layout
         TwoColorsStackView.axis = UILayoutConstraintAxis(rawValue: 1)! // 0 for horizontal, 1 for vertical
      } else {
         // Landscape
         
         // Set slider widths
         // (screenWidth will be width in this orientation)
         sliderWidth = CGFloat(screenWidth - marginWidth - (25+8+8+40) - marginWidth - (25+8+8+40) - marginWidth) / 2.0
         mixerSliderWidth = CGFloat(screenWidth - marginWidth - 20 - 8 - 20 - 8 - marginWidth)
         
         // Set stackview layout
         TwoColorsStackView.axis = UILayoutConstraintAxis(rawValue: 0)! // 0 for horizontal, 1 for vertical
      }
      
      // Set slider widths
      Color1RSliderWidthConstraint.constant = sliderWidth
      Color1GSliderWidthConstraint.constant = sliderWidth
      Color1BSliderWidthConstraint.constant = sliderWidth
      Color2RSliderWidthConstraint.constant = sliderWidth
      Color2GSliderWidthConstraint.constant = sliderWidth
      Color2BSliderWidthConstraint.constant = sliderWidth
      MixerSliderWidthConstraint.constant = mixerSliderWidth

   }
   
   override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
      if UIDevice.current.orientation.isPortrait {
         setLayout(mode: 0)
      } else {
         setLayout(mode: 1)
      }
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setLayout(mode: 0) // portrait by default, will switch after loading if it's in landscape
      
      // Drawing code from http://www.seemuapps.com/swift-introduction-core-graphics-for-beginners
      let x1:Int = 100
      let y1:Int = 100
      let x2:Int = 200
      let y2:Int = 200
      let squarePath = UIBezierPath()
      squarePath.move(to: CGPoint(x: x1, y: y1))
      squarePath.addLine(to: CGPoint(x: x2, y: y1))
      squarePath.addLine(to: CGPoint(x: x2, y: y2))
      squarePath.addLine(to: CGPoint(x: x1, y: y2))
      squarePath.close()
      
//      let components: [CGFloat] = [1.0, 1.0, 0.0]
//      UIColor(cgColor: CGColor(colorSpace: <#T##CGColorSpace#>, components: <#T##UnsafePointer<CGFloat>#>))
//      UIColor(cgColor: CGColor(colorsp), components: components))
      
//      let square = CAShapeLayer() // 6
//      square.path = squarePath.cgPath // 7 Apply the squarePath to our layer
//      square.fillColor = UIColor.red.cgColor // 8 Fill it with red
//      self.view.layer.addSublayer(square) // 9 Add it to our view
      //
            //      let myrect = CGRect(x: 100, y: 100, width: 20, height: 30)
      //      myrect.

   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }

   @IBAction func onTapGestureRecognized(_ sender: Any) {
      print("Tap recognized")
      Color1RTextOutlet.resignFirstResponder()
      Color1GTextOutlet.resignFirstResponder()
      Color1BTextOutlet.resignFirstResponder()
      Color2RTextOutlet.resignFirstResponder()
      Color2GTextOutlet.resignFirstResponder()
      Color2BTextOutlet.resignFirstResponder()
      recalculate()
   }
}

