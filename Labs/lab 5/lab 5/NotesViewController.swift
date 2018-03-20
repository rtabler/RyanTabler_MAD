//
//  NotesViewController.swift
//  lab 5
//
//  Created by Ryan Tabler on 3/20/18.
//  Copyright © 2018 Ryan Tabler. All rights reserved.
//

import UIKit
import RealmSwift
import Firebase

class NotesViewController: UITableViewController {

    let cellIdentifier = "NoteCell"
    
    // app-wide database
    // Realm
    var realm: Realm!
    var realmNotes: Results<RealmNote> {
        get {
            return realm.objects(RealmNote.self)
        }
    }
    // Firebase
    var ref: DatabaseReference!
    var firebaseNotes = [FirebaseNote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.tableView.separatorColor = self.tableView.backgroundColor
        
        // initialize the realm variable
        do {
            realm = try Realm()
        } catch let error {
            print(error.localizedDescription)
        }
        // initialize the firebase variable
        ref = Database.database().reference()
        //set up a listener for Firebase data change events
        //this event will fire with the initial data and then all data changes
        ref.observe(DataEventType.value, with: {snapshot in self.firebaseNotes=[]
            //DataSnapshot represents the Firebase data at a given time //loop through all the child data nodes
            for fNote in snapshot.children.allObjects as! [DataSnapshot]{
                if let noteValue = fNote.value as? [String: String],
                    //get value as a Dictionary
                    let json = try? JSONEncoder().encode(noteValue),
                    //encode as JSON
                    let newNote = try? JSONDecoder().decode(FirebaseNote.self, from: json) //decode JSON to Recipe
                {
                    self.firebaseNotes.append(newNote)
                }
            }
            self.tableView.reloadData()
        })
    }

    func addRealmNote(newNote: RealmNote) {
        do {
            try self.realm.write {
                realm.add(newNote)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    func addFirebaseNote(newNote: FirebaseNote) {
        //add recipe to recipes array
//        recipes.append(newRecipe)
        //create Dictionary
        let newNoteDict = ["noteText": newNote.noteText]
        let noteref = ref.childByAutoId()
        noteref.setValue(newNoteDict)
    }
    func deleteRealmNote(noteToDelete: RealmNote) {
        do {
            try self.realm.write {
                realm.delete(noteToDelete)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    func deleteFirebaseNote(noteToDelete: FirebaseNote) {
        let reciperef = ref.child(noteToDelete.noteText)
        ref.observeSingleEvent(of: .value, with: {snapshot in self.firebaseNotes=[]
            //DataSnapshot represents the Firebase data at a given time //loop through all the child data nodes
            for childNote in snapshot.children.allObjects as! [DataSnapshot] {
                let childKey = childNote.key
                if let childNote = childNote.value as? [String: String] {
                    if childNote["noteText"] == noteToDelete.noteText {
                        let childToRemove = self.ref.child(childKey)
                        childToRemove.removeValue()
                        break
                    }
                }
            }
            self.tableView.reloadData()
        })
        reciperef.ref.removeValue()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openNote" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                print(indexPath.section)
                print(indexPath.row)
                let noteView = segue.destination as! NoteController
                if indexPath.section == 0 {
                    noteView.textToDisplay = realmNotes[indexPath.row].noteText
                } else if indexPath.section == 1 {
                    noteView.textToDisplay = firebaseNotes[indexPath.row].noteText
                }
            }
        }
    }
    
    @IBAction func unwindSegue(segue:UIStoryboardSegue){
        let addNC = segue.source as! AddNoteController
        if segue.identifier == "cancelSegue" {
            print("You hit cancel")
        } else if segue.identifier == "saveSegue" {
            print("You hit save")
            if addNC.addToRealmSwitch.isOn {
                var newNote = RealmNote()
                newNote.noteText = addNC.textToAdd.text
                addRealmNote(newNote: newNote)
            }
            if addNC.addToFirebaseSwitch.isOn {
                var newNote = FirebaseNote()
                newNote.noteText = addNC.textToAdd.text
                addFirebaseNote(newNote: newNote)
            }
            tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
//    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        return
//    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ["On device","In cloud"][section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return realmNotes.count
        } else if section == 1 {
            return firebaseNotes.count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        if indexPath.section == 0 {
            cell.textLabel?.text = realmNotes[indexPath.row].noteText
        } else if indexPath.section == 1 {
            cell.textLabel?.text = firebaseNotes[indexPath.row].noteText
        }

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            if indexPath.section == 0 {
                let noteToDelete = realmNotes[indexPath.row]
                deleteRealmNote(noteToDelete: noteToDelete)
            } else if indexPath.section == 1 {
                let noteToDelete = firebaseNotes[indexPath.row]
                deleteFirebaseNote(noteToDelete: noteToDelete)
            }
//            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
