//
//  ViewController.swift
//  lab 2
//
//  Created by Ryan Tabler on 9/20/17.
//  Copyright © 2017 Ryan Tabler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   @IBOutlet weak var BirbImage: UIImageView!
   @IBOutlet weak var BirbCaptionLabel: UILabel!
   var originalImageRect : CGRect? = nil
   @IBOutlet weak var BirbSizeSliderOutlet: UISlider!
   @IBOutlet weak var CapsSwitch: UISwitch!
   
   @IBOutlet weak var BirbHeightConstraint: NSLayoutConstraint!
   @IBOutlet weak var BirbLeadingConstraint: NSLayoutConstraint!
   @IBOutlet weak var BirbTrailingConstraint: NSLayoutConstraint!

   func resizeBirb() {
      let screenSize: CGRect = UIScreen.main.bounds
      let screenWidth: Float = Float(screenSize.width)
      
      // Calculate the inset to effectively scale from 0 to screenWidth
      let newInset: CGFloat = CGFloat((screenWidth - screenWidth * BirbSizeSliderOutlet.value) * 0.5)
      
      // Change the leading and trailing inset constraints. Height stays the same, so the aspect-fit image will scale only by the width.
      BirbLeadingConstraint.constant = newInset
      BirbTrailingConstraint.constant = newInset
   }

   @IBAction func BirbBarButton(_ sender: UISegmentedControl) {
//      resizeBirb()
      
      var filename: String = "birb"
      var caption: String = "applies to any bird"
      if sender.selectedSegmentIndex == 0 {
         filename = "barb"
         caption = "an intimidating bird"
      } else if sender.selectedSegmentIndex == 1 {
         filename = "berb"
         caption = "a fast, thin bird"
      } else if sender.selectedSegmentIndex == 2 {
         filename = "birb"
         caption = "applies to any bird"
      } else if sender.selectedSegmentIndex == 3 {
         filename = "borb"
         caption = "a fat and/or adorable bird"
      } else if sender.selectedSegmentIndex == 4 {
         filename = "burb"
         caption = "a bird that is diminutive in size"
      } else if sender.selectedSegmentIndex == 5 {
         filename = "byrb"
         caption = "a mysterious bird"
      }
      filename += ".png"
      if CapsSwitch.isOn {
         caption = caption.uppercased()
      }
//      print(filename)

      BirbImage.image = UIImage(named: filename)
      BirbCaptionLabel.text = caption
//      resizeBirb()
   }
   
   @IBAction func BirbSizeSlider(_ sender: UISlider) {
      resizeBirb()
   }
   
   @IBAction func Capsify(_ sender: UISwitch) {
      if sender.isOn {
         BirbCaptionLabel.text = BirbCaptionLabel.text?.uppercased()
         BirbCaptionLabel.textColor = UIColor(red: 1.0, green: 0.0, blue: 0.5, alpha: 1.0)
         BirbCaptionLabel.font = UIFont(name: BirbCaptionLabel.font.fontName, size: 18.0)
      } else {
         BirbCaptionLabel.text = BirbCaptionLabel.text?.lowercased()
         BirbCaptionLabel.textColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
         BirbCaptionLabel.font = UIFont(name: BirbCaptionLabel.font.fontName, size: 16.0)
      }
   }
   

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
   }
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
   }
   override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      // Do additional setup after frames are set (this happens after viewDidLoad() and viewWillAppear())
      
      // 0.8 is the largest aspect ratio of the 6 pictures, so to give all 6 pictures room, height must be screenWidth * 0.8
      let screenSize: CGRect = UIScreen.main.bounds
      let screenWidth: Float = Float(screenSize.width)
      BirbHeightConstraint.constant = CGFloat(0.8 * screenWidth)
      
      originalImageRect = BirbImage.frame
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }


}

