//
//  TextViewController.swift
//  project 1
//
//  Created by Ryan Tabler on 3/8/18.
//  Copyright © 2018 Ryan Tabler. All rights reserved.
//

import UIKit
import RealmSwift

class TextViewController: UIViewController {

    // app-wide database
    var realm: Realm!
    var settingses: Results<Settings> {
        get {
            return realm.objects(Settings.self)
        }
    }
    var favorites: Results<Favorite> {
        get {
            return realm.objects(Favorite.self)
        }
    }
    
    // data from other views
    var chapterNumber: Int?
    
    
    @IBOutlet weak var translationButtonOutlet: UIBarButtonItem!
    @IBAction func TranslationButtonAction(_ sender: UIBarButtonItem) {
        let currentTranslator = settingses[0].currentTranslator
        var nextTranslator = ""
        if currentTranslator == "Mitchell" {
            nextTranslator = "FengEnglish"
        } else if currentTranslator == "FengEnglish" {
            nextTranslator = "Mitchell"
        }
        do {
            try self.realm.write {
                settingses[0].currentTranslator = nextTranslator
            }
        } catch let error {
            print(error.localizedDescription)
        }
        updateTranslationButton()
        setText()
    }
    func updateTranslationButton() {
        let currentTranslator = settingses[0].currentTranslator
        var currentTranslatorDisp = ""
        if currentTranslator == "Mitchell" {
            currentTranslatorDisp = "Mitchell"
        } else if currentTranslator == "FengEnglish" {
            currentTranslatorDisp = "Feng/English"
        }
        translationButtonOutlet.title = "Transl: \(currentTranslatorDisp)"
    }
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var chapterNumberLabel: UILabel!
    
    @IBOutlet weak var favoriteButtonOutlet: UIButton!
    @IBAction func favoriteButtonAction(_ sender: UIButton) {
        print("tapped")
        let thisFavorite = thisIsFavorite()
        if thisFavorite == nil {
            // this chapter is not a favorite, so add it now
            do {
                try self.realm.write {
                    let newFavorite = Favorite()
                    newFavorite.item = chapterNumber!
                    realm.add(newFavorite)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            // this chapter is a favorite, so remove it now
            do {
            try self.realm.write {
                realm.delete(thisFavorite!)
            }
        } catch let error {
            print(error.localizedDescription)
            }
        }
        // update the view to reflect the model
        updateFavoriteButton()
    }
    // checks if this item is favorited,
    // returns the Favorite item if it is,
    // returns nil otherwise
    func thisIsFavorite() -> Favorite? {
        // check if this chapter is a favorite
        var thisFavorite: Favorite?
        for favorite in favorites {
            if favorite.item == chapterNumber! {
                thisFavorite = favorite
                break
            }
        }
        return thisFavorite
    }
    // updates the view based on whether the item is favorited in realm
    func updateFavoriteButton() {
        let favoriteItem = thisIsFavorite()
        var imageToSet = ""
        if favoriteItem == nil {
            // this chapter is not a favorite
            imageToSet = "icons8-star-50.png"
        } else {
            // this chapter is a favorite
            imageToSet = "icons8-star-filled-50.png"
        }
        favoriteButtonOutlet.setImage(UIImage(named: imageToSet), for: UIControlState.normal)
    }

    @IBAction func shareButtonAction(_ sender: UIButton) {
    }
    
    
    
    @IBOutlet weak var bodyText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initialize the realm variable
        do {
            realm = try Realm()
        } catch let error {
            print(error.localizedDescription)
        }
        
        
//        do {
//            try self.realm.write {
//                realm.deleteAll()
//            }
//        } catch let error {
//            print(error.localizedDescription)
//        }
//        print(favorites.count)
        
        updateTranslationButton()
        // check if this chapter is a favorite
        updateFavoriteButton()
        
        
        chapterNumberLabel.text = String(chapterNumber!)
        
        scrollView.contentSize = CGSize(width: CGFloat(1000.0), height: CGFloat(100.0))
        print(scrollView.isScrollEnabled)
        print(scrollView.showsVerticalScrollIndicator)
        
//        if let plistUrl = Bundle.main.url(forResource: "favorites", withExtension: "plist") {
//            let plistdecoder = PropertyListDecoder()
//            do {
//                let data = try Data(contentsOf: plistUrl)
//                favorites = try plistdecoder.decode([Int].self, from: data)
//                print(favorites!)
//                if favorites!.contains(3) {
//                    print("Found 3")
//                }
//                if favorites!.contains(4) {
//                    print("Found 4")
//                }
//                var imageToSet = ""
//                if favorites!.contains(chapterNumber!) {
//                    imageToSet = "icons8-star-filled-50.png"
//                } else {
//                    imageToSet = "icons8-star-50.png"
//                }
//                favoriteButtonOutlet.setImage(UIImage(named: imageToSet), for: UIControlState.normal)
//            } catch {
//                print("Expected [Int] in favorites.plist")
//                print(error)
//            }
//        } else {
//            print("Could not find favorites.plist")
//        }
        
        setText()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setText() {
        let currentTranslator = settingses[0].currentTranslator
        print(currentTranslator)
        
        if let path = Bundle.main.path(forResource: "\(currentTranslator)-\(chapterNumber!)", ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let myStrings = data.components(separatedBy: .newlines)
                //                print()
                bodyText.text = myStrings.joined(separator: "\n")
            } catch {
                print(error)
            }
        } else {
            print("Couldn't find \(currentTranslator) text")
        }
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
