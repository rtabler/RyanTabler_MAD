//
//  NoteController.swift
//  lab 5
//
//  Created by Ryan Tabler on 3/20/18.
//  Copyright © 2018 Ryan Tabler. All rights reserved.
//

import UIKit

class NoteController: UIViewController {

    var textToDisplay: String?
    @IBOutlet weak var noteTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if textToDisplay == nil {
            textToDisplay = ""
        }
        noteTextView.text = textToDisplay
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
