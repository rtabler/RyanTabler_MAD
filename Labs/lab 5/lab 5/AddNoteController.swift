//
//  AddNoteController.swift
//  lab 5
//
//  Created by Ryan Tabler on 3/20/18.
//  Copyright © 2018 Ryan Tabler. All rights reserved.
//

import UIKit

class AddNoteController: UIViewController {

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var addToRealmSwitch: UISwitch!
    @IBOutlet weak var addToFirebaseSwitch: UISwitch!
    @IBOutlet weak var textToAdd: UITextView!

    
    func guardSaveButton() {
        if !addToRealmSwitch.isOn && !addToFirebaseSwitch.isOn {
            saveButton.isEnabled = false
        } else {
            saveButton.isEnabled = true
        }
    }
    @IBAction func addToRealmSwitchAction(_ sender: UISwitch) {
        guardSaveButton()
    }
    @IBAction func addToFirebaseSwitchAction(_ sender: UISwitch) {
        guardSaveButton()
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
