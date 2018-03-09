//
//  TextViewController.swift
//  project 1
//
//  Created by Ryan Tabler on 3/8/18.
//  Copyright © 2018 Ryan Tabler. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    var chapterNumber: Int?
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var chapterNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chapterNumberLabel.text = String(chapterNumber!)
        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSize(width: CGFloat(1000.0), height: CGFloat(100.0))
        print(scrollView.isScrollEnabled)
        print(scrollView.showsVerticalScrollIndicator)
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
