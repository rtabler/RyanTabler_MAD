//
//  SoundTabViewController.swift
//  lab 1
//
//  Created by Ryan Tabler on 2/8/18.
//  Copyright © 2018 Ryan Tabler. All rights reserved.
//

import UIKit
import AVFoundation

class SoundTabViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, AVAudioPlayerDelegate {
   
   let rootComponent = 0
   let chordComponent = 1
   
   var rootNames = ["C","Db","D","Eb","E","F","Gb","G","Ab","A","Bb","B"]
   var chordTypes = ["Major","Minor","Dominant 7th"]

   @IBOutlet weak var chordPicker: UIPickerView!
   @IBOutlet weak var playButton: UIButton!
   
   var audioPlayer: AVAudioPlayer?
   var audioPlayers = [AVAudioPlayer?]()
   
   func playNotes(notes: [Int]) {
      audioPlayers.removeAll()
      do {
         for n in notes {
            guard let url = Bundle.main.url(forResource: "musicnotes/note\(n+1)s", withExtension: "mp3") else {
               print("guarded")
               return
            }
            try audioPlayer = AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            audioPlayer!.delegate = self
            audioPlayer!.prepareToPlay()
            audioPlayers.append(audioPlayer)
         }
      } catch let error as NSError {
         print("audioPlayer error: \(error.localizedDescription)")
      }
      for p in audioPlayers {
         p!.play()
      }
   }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
   @IBAction func playChord(_ sender: UIButton) {
      var notePattern = [Int]()
      let rootIndex = chordPicker.selectedRow(inComponent: rootComponent)
      let chordType = chordPicker.selectedRow(inComponent: chordComponent)
      if chordTypes[chordType] == "Major" {
         notePattern = [0,4,7]
      } else if chordTypes[chordType] == "Minor" {
         notePattern = [0,3,7]
      } else if chordTypes[chordType] == "Dominant 7th" {
         notePattern = [0,4,7,10]
      }
      for i in notePattern.indices {
         notePattern[i] = (notePattern[i] + rootIndex) % 12
      }
      playNotes(notes: notePattern)
   }
   

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 2
    }

    func pickerView(_ pickerView: UIPickerView,  numberOfRowsInComponent component: Int) -> Int
    {
         if component == rootComponent {
            return rootNames.count
         } else if component == chordComponent {
            return chordTypes.count
         }
         return 0
    }
   func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      if component == rootComponent {
         return rootNames[row]
      } else if component == chordComponent {
         return chordTypes[row]
      }
      return "ERROR"
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
