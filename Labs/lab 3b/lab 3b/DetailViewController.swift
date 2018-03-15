//
//  DetailViewController.swift
//  lab 3b
//
//  Created by Ryan Tabler on 3/15/18.
//  Copyright © 2018 Ryan Tabler. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // imported vars
    var imageName: String?
    
    // outlets
    @IBOutlet weak var recipeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageName == nil {
            imageName = "IMG_default.jpeg"
        }
        recipeImage.image = UIImage(named: imageName!)
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
