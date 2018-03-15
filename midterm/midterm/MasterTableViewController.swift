//
//  MasterTableViewController.swift
//  midterm
//
//  Created by Ryan Tabler on 3/15/18.
//  Copyright © 2018 Ryan Tabler. All rights reserved.
//

import UIKit
import RealmSwift

class MasterTableViewController: UITableViewController {

    var cellIdentifier = "MasterCell"
    
    // app-wide database
    var realm: Realm!
    var restaurants: Results<Restaurant> {
        get {
            return realm.objects(Restaurant.self)
        }
    }
    
//    var restaurants = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //initialize the realm variable
        do {
            realm = try Realm()
        } catch let error {
            print(error.localizedDescription)
        }
        

        // Uncomment to force the database to start from zero
//        do {
//            try self.realm.write {
//                realm.deleteAll()
//            }
//        } catch let error {
//            print(error.localizedDescription)
//        }
        if restaurants.count == 0 {
            do {
                // URL for our plist
                var restaurantsFromPlist = [[String: String]]()
                if let pathURL = Bundle.main.url(forResource: "restaurants", withExtension: "plist"){
                    //creates a property list decoder object
                    let plistdecoder = PropertyListDecoder()
                    do {
                        let data = try Data(contentsOf: pathURL)
                        //decodes the property list
                        restaurantsFromPlist = try plistdecoder.decode([[String:String]].self, from: data)
                    } catch {
                        // handle error
                        print(error)
                    }
                }
                for i in 0...3 {
                    let newRestaurant = Restaurant()
                    newRestaurant.name = restaurantsFromPlist[i]["name"]!
                    newRestaurant.url = restaurantsFromPlist[i]["url"]!
                    try realm.write {
                        realm.add(newRestaurant)
                    }
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "visitSite" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let webVC = segue.destination as! DetailViewController
                webVC.title = restaurants[indexPath.row].name
                webVC.url = restaurants[indexPath.row].url
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = restaurants[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            tableView.deleteRows(at: [indexPath], with: .automatic)
            do {
                try self.realm.write {
                    let restaurantToDelete = restaurants[indexPath.row]
                    realm.delete(restaurantToDelete)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
