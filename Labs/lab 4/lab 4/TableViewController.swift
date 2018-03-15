//
//  TableViewController.swift
//  lab 4
//
//  Created by Ryan Tabler on 3/5/18.
//  Copyright © 2018 Ryan Tabler. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

//   var words = [String]()
   var searchController : UISearchController!
   
   var alltitles = [String]()
   var allurls = [String]()
   var allauthors = [String]()
   
   
   func loadjson() {
      let urlPath = "https://www.reddit.com/r/dataisbeautiful.json"
      guard let url = URL(string: urlPath) else {
         print("url error")
         return
      }
      let session = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
         let httpResponse = response as! HTTPURLResponse
         let statusCode = httpResponse.statusCode
         guard statusCode == 200 else {
            print("file download error")
            return
         }
         //download successful
         print("download complete")
         // call parsejson() asynchronously so view doesn't freeze
         DispatchQueue.main.async {
            self.parsejson(data!)
         }
      })
      //must call resume to run session
      session.resume()
   }
   func parsejson(_ alldata: Data) {
      alltitles.removeAll(keepingCapacity: true)
      allurls.removeAll(keepingCapacity: true)
      allauthors.removeAll(keepingCapacity: true)
      do {
         // get json data
         let json = try JSONSerialization.jsonObject(with: alldata, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:Any]
         //get all results
         let data = json["data"] as! [String:Any]
         let allposts = data["children"] as! [Dictionary<String,Any>]
         for post in allposts {
            let postdata = post["data"] as! Dictionary<String,Any>
            let thisPostStickied = postdata["stickied"] as! Bool
            if thisPostStickied {
               // this post is "stickied", so until I can distinguish stickied posts
               // from other posts, I will not show stickied posts in the tableview
               continue
            }
            let thisPostWhitelistStatus = postdata["whitelist_status"] as! String
            if thisPostWhitelistStatus.range(of: "nsfw") != nil {
               // this post is labeled NSFW, so I should not show it for this assignment
               continue
            }
            // save title, url, author for each post
            alltitles.append(postdata["title"] as! String)
            allurls.append(postdata["url"] as! String)
            allauthors.append(postdata["author"] as! String)
         }
      } catch {
         print("Error with JSON: \(error)")
         return
      }
      //reload the table data after the json data has been downloaded
      tableView.reloadData()
   }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "showDetail" {
         if let indexPath = self.tableView.indexPathForSelectedRow {
            let title = alltitles[indexPath.row]
            let url = allurls[indexPath.row]
            let controller = segue.destination as! DetailViewController
//            let controller = (segue.destination as! Detail).topViewController as! DetailViewController
            controller.detailItem = url
            controller.title = title
            // I need to understand this better to fix my broken navigation...
            controller.navigationItem.leftBarButtonItem = self.navigationController?.navigationItem.backBarButtonItem
            controller.navigationItem.leftItemsSupplementBackButton = true
         }
      }
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // URL for our plist
//      if let pathURL = Bundle.main.url(forResource: "qwordswithoutu1", withExtension: "plist"){
//         //creates a property list decoder object
//         let plistdecoder = PropertyListDecoder()
//         do {
//            let data = try Data(contentsOf: pathURL)
//            //decodes the property list
//            words = try plistdecoder.decode([String].self, from: data)
//         } catch {
//            // handle error
//            print(error) }
//      }
      
      loadjson()
      
      //search results
      let resultsController = SearchResultsController() //create an instance of our SearchResultsController class
//      print("TableViewController words:")
//      print(words)
//      resultsController.allwords = words //set the allwords property to our words array
      searchController = UISearchController(searchResultsController: resultsController) //initialize our search controller with the resultsController when it has search results to display
      //search bar configuration
      searchController.searchBar.placeholder = "Enter a search term" //place holder text
      searchController.searchBar.sizeToFit() //sets appropriate size for the search bar
      // HERE IS WHERE IT IS ADDED
//      tableView.tableHeaderView=searchController.searchBar //install the search bar as the table header
      searchController.searchResultsUpdater = resultsController //sets the instance to update search results
   }
   
   //Required methods for UITableViewDataSource // Customize the number of rows in the section
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return alltitles.count
   }
   // Displays table view cells
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      //dequeues an existing cell if one is available, or creates a new one and adds it to the table
      let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
      cell.textLabel?.text = alltitles[indexPath.row]
//      cell.imageView?.image=UIImage(named: "scrabble_q.png")
      cell.detailTextLabel?.text = allauthors[indexPath.row]
      return cell
   }
   
   //UITableViewDelegate method that is called when a row is selected
//   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//      let alert = UIAlertController(title: "Row selected", message: "You selected \(alltitles[indexPath.row])", preferredStyle: .alert)
//      let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//      alert.addAction(okAction)
//      present(alert, animated: true, completion: nil)
//      tableView.deselectRow(at: indexPath, animated: true) //deselects the row that had been choosen
//   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
}

