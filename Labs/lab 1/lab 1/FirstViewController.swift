//
//  FirstViewController.swift
//  lab 1
//
//  Created by Ryan Tabler on 2/6/18.
//  Copyright © 2018 Ryan Tabler. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
   @IBOutlet weak var modesPicker: UIPickerView!
   @IBOutlet weak var scaleLabel: UILabel!
   
   let modeComponent = 1
   let rootComponent = 0
   
   //   var allData = [String: [[String: [Int]]]]()
   var modesData = [String: [Int]]()
   var modeNames = [String]()
   var rootNames = [String]()
//   var chordNames
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Get Mode information from plist
      if let plistUrl = Bundle.main.url(forResource: "modes", withExtension: "plist") {
         let plistdecoder = PropertyListDecoder()
         do {
            let data = try Data(contentsOf: plistUrl)
            modesData = try plistdecoder.decode([String: [Int ]].self, from: data)
            modeNames = Array(modesData.keys)
            rootNames = ["C","Db","D","Eb","E","F","Gb","G","Ab","A","Bb","B"]
            
            modesPicker.selectRow(5, inComponent: modeComponent, animated: true)
            
            scaleLabel.text = calcScale(mode: "Ionian", root: 0)
            
         } catch {
            print(error)
         }
      } else {
         print("Could not find plist")
      }
   }

   func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 2
   }
   
   // number of rows in component
   func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      if component == modeComponent {
         return modeNames.count
      } else if component == rootComponent {
         return rootNames.count
      }
      return 0
   }
   // row names
   func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      if component == modeComponent {
         return modeNames[row]
      } else if component == rootComponent {
         return rootNames[row]
      }
      return "ERROR"
   }
   
   func calcScale(mode:String, root:Int) -> String {
      let chordPattern = modesData[mode]
      var scale = ""
      for c in chordPattern! {
         let noteIndex = (c+root) % 12
         scale += rootNames[noteIndex]
         scale += " "
      }
      scale += rootNames[root]
      return scale
   }
   func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      let selectedMode = modeNames[modesPicker.selectedRow(inComponent: modeComponent)]
      let selectedRootNumber = modesPicker.selectedRow(inComponent: rootComponent)
   
      let scale = calcScale(mode: selectedMode, root: selectedRootNumber)
      scaleLabel.text = scale
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }


}

