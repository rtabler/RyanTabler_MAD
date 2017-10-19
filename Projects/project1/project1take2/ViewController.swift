//
//  ViewController.swift
//  project1take2
//
//  Created by Ryan Tabler on 10/16/17.
//  Copyright © 2017 Ryan Tabler. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

   // Color canvas shape objects
   var color1ShapeLayer:CAShapeLayer?
   var color2ShapeLayer:CAShapeLayer?
   var colorResultShapeLayer:CAShapeLayer?

   @IBOutlet var MainView: UIView!
   @IBOutlet weak var CanvasView: UIView!
   
   @IBOutlet weak var Color1StackView: UIStackView!
   @IBOutlet weak var Color2StackView: UIStackView!
   
   @IBOutlet weak var Color1Label: UILabel!
   @IBOutlet weak var Color1CanvasView: UIView!
   @IBOutlet weak var Color1CanvasViewWidth: NSLayoutConstraint!
   @IBOutlet weak var Color1CanvasViewHeight: NSLayoutConstraint!
   @IBOutlet weak var Color2Label: UILabel!
   @IBOutlet weak var Color2CanvasView: UIView!
   @IBOutlet weak var Color2CanvasViewWidth: NSLayoutConstraint!
   @IBOutlet weak var Color2CanvasViewHeight: NSLayoutConstraint!
   @IBOutlet weak var ColorResultLabel: UILabel!
   @IBOutlet weak var ColorResultCanvasView: UIView!
   @IBOutlet weak var ColorResultCanvasViewWidth: NSLayoutConstraint!
   @IBOutlet weak var ColorResultCanvasViewHeight: NSLayoutConstraint!
   
   
   
   
   // stack views
   @IBOutlet weak var TwoColorsStackView: UIStackView!
   @IBOutlet weak var ResultStackView: UIStackView!
   @IBOutlet weak var ResultDataStackView: UIStackView!
   
   
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
   
   // mixer
   @IBOutlet weak var MixerPercentageText: UITextField!
   
   // results outlets
   @IBOutlet weak var RGBResultText: UITextField!
   @IBOutlet weak var HexResultText: UITextField!
   
   
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
      
      RGBResultText.text = "rgb("+String(resRint)+","+String(resGint)+","+String(resBint)+")"
      HexResultText.text = ""
      
      
      if color1ShapeLayer == nil {
         print("Drawing rectangles")
         // Drawing the rectangles for the first time
         // Drawing code from http://www.seemuapps.com/swift-introduction-core-graphics-for-beginners
         let x1:Int = 0
         let y1:Int = 0
         let x2:Int = Int(Color1CanvasViewWidth.constant) //only using color1 label because both labels are set to the same width
         let y2:Int = Int(Color1CanvasViewHeight.constant)
         let squarePath = UIBezierPath()
         squarePath.lineWidth = CGFloat(5.0)
         squarePath.stroke()
         squarePath.move(to: CGPoint(x: x1, y: y1))
         squarePath.addLine(to: CGPoint(x: x2, y: y1))
         squarePath.addLine(to: CGPoint(x: x2, y: y2))
         squarePath.addLine(to: CGPoint(x: x1, y: y2))
         squarePath.close()
         
         // Make color1 canvas
         color1ShapeLayer = CAShapeLayer()
//         color1ShapeLayer!.borderWidth = CGFloat(5.0)
//         color1ShapeLayer!.borderColor = UIColor.black.cgColor
         color1ShapeLayer!.path = squarePath.cgPath
         Color1CanvasView.layer.addSublayer(color1ShapeLayer!)
         
         // Make color2 canvas
         color2ShapeLayer = CAShapeLayer()
//         color2ShapeLayer!.borderWidth = CGFloat(5.0)
//         color2ShapeLayer!.borderColor = UIColor.black.cgColor
         color2ShapeLayer!.path = squarePath.cgPath
         Color2CanvasView.layer.addSublayer(color2ShapeLayer!)
         
         // Make color result canvas
         colorResultShapeLayer = CAShapeLayer()
         colorResultShapeLayer!.path = squarePath.cgPath
         ColorResultCanvasView.layer.addSublayer(colorResultShapeLayer!)
      }
      
      // Set the color
      color1ShapeLayer!.fillColor = UIColor.init(red: CGFloat(c1r), green: CGFloat(c1g), blue: CGFloat(c1b), alpha: 1.0).cgColor
      color2ShapeLayer!.fillColor = UIColor.init(red: CGFloat(c2r), green: CGFloat(c2g), blue: CGFloat(c2b), alpha: 1.0).cgColor
      colorResultShapeLayer!.fillColor = UIColor.init(red: CGFloat(resRfloat), green: CGFloat(resGfloat), blue: CGFloat(resBfloat), alpha: 1.0).cgColor
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
      MixerPercentageText.text = String(Int(sender.value*100))
      recalculate()
   }
   
   
   // textbox actions
   func updateFromTextbox(sender:UITextField, settee:UISlider, maxVal:Int) {
      var numOpt:Int? = Int(sender.text!)
      // Set text to "0" if it's invalid for any reason
      if numOpt == nil {
         sender.text = "0"
         numOpt = 0
      }
      var num = numOpt!
      if num > maxVal {
         num = maxVal
         sender.text = String(maxVal)
      } else if num < 0 {
         num = 0
         sender.text = "0"
      }
      settee.value = Float(num) / Float(maxVal)
      
   }
   @IBAction func Color1RTextAction(_ sender: UITextField) {
      updateFromTextbox(sender: sender, settee: Color1RSliderOutlet, maxVal: 255)
      recalculate()
   }
   @IBAction func Color1GTextAction(_ sender: UITextField) {
      updateFromTextbox(sender: sender, settee: Color1GSliderOutlet, maxVal: 255)
      recalculate()
   }
   @IBAction func Color1BTextAction(_ sender: UITextField) {
      updateFromTextbox(sender: sender, settee: Color1BSliderOutlet, maxVal: 255)
      recalculate()
   }
   @IBAction func Color2RTextAction(_ sender: UITextField) {
      updateFromTextbox(sender: sender, settee: Color2RSliderOutlet, maxVal: 255)
      recalculate()
   }
   @IBAction func Color2GTextAction(_ sender: UITextField) {
      updateFromTextbox(sender: sender, settee: Color2GSliderOutlet, maxVal: 255)
      recalculate()
   }
   @IBAction func Color2BTextAction(_ sender: UITextField) {
      updateFromTextbox(sender: sender, settee: Color2BSliderOutlet, maxVal: 255)
      recalculate()
   }
   @IBAction func MixerPercentageTextAction(_ sender: UITextField) {
      updateFromTextbox(sender: sender, settee: MixerSliderOutlet, maxVal: 100)
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
      
      // Things to tear apart
      color1ShapeLayer?.removeFromSuperlayer()
      color1ShapeLayer = nil
      color2ShapeLayer?.removeFromSuperlayer()
      color2ShapeLayer = nil
      colorResultShapeLayer?.removeFromSuperlayer()
      colorResultShapeLayer = nil
      
      // Vars to set directly, that are the same between orientations
      // canvas view heights
      Color1CanvasViewHeight.constant = Color1Label.bounds.height
      Color2CanvasViewHeight.constant = Color2Label.bounds.height
      ColorResultCanvasViewHeight.constant = ColorResultLabel.bounds.height
      
      // Vars we will set
      var colorCanvasWidth:CGFloat = 50.0
      var sliderWidth:CGFloat = 100.0
      var mixerSliderWidth:CGFloat = 100.0
      
      if mode == 0 {
         // Portrait
         
         // Set canvas width
         colorCanvasWidth = CGFloat(screenWidth - marginWidth - 16 - Color1Label.bounds.width - 8 - 16 - marginWidth)
         
         // Set slider widths
         sliderWidth = CGFloat(screenWidth - marginWidth - 16 - (25 + 8 + 8 + 50) - 16 - marginWidth)
         mixerSliderWidth = CGFloat(screenWidth - marginWidth - 16 - (20 + 8 + 8 + 20) - 16 - marginWidth)
         
         // Set stackview layout
         TwoColorsStackView.axis = UILayoutConstraintAxis(rawValue: 1)! // 0 for horizontal, 1 for vertical
         ResultStackView.axis = UILayoutConstraintAxis(rawValue: 1)!
         ResultDataStackView.axis = UILayoutConstraintAxis(rawValue: 1)!
      } else {
         // Landscape
         
         // Set canvas width
         colorCanvasWidth = CGFloat(screenWidth - marginWidth - 16 - (Color1Label.bounds.width+8) - 16 - (Color1Label.bounds.width+8) - 16 - marginWidth) / 2.0
         
         // Set slider widths
         // (screenWidth will be width in this orientation)
         sliderWidth = CGFloat(screenWidth - marginWidth - 16 - (25+8+8+50) - 16 - (25+8+8+50) - 16 - marginWidth) / 2.0
         mixerSliderWidth = CGFloat(screenWidth - marginWidth - 16 - 20 - 8 - 8 - 20 - 16 - marginWidth)
         
         // Set stackview layout
         TwoColorsStackView.axis = UILayoutConstraintAxis(rawValue: 0)! // 0 for horizontal, 1 for vertical
         ResultStackView.axis = UILayoutConstraintAxis(rawValue: 0)!
         ResultDataStackView.axis = UILayoutConstraintAxis(rawValue: 0)!
      }
      
      // Set canvas widths
      Color1CanvasViewWidth.constant = colorCanvasWidth
      Color2CanvasViewWidth.constant = colorCanvasWidth
      ColorResultCanvasViewWidth.constant = colorCanvasWidth
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
      recalculate()
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setLayout(mode: 0) // portrait by default, will switch after loading if it's in landscape
      recalculate()
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
      MixerPercentageText.resignFirstResponder()
      recalculate()
   }
}

