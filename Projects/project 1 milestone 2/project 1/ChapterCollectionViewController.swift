//
//  ChapterCollectionViewController.swift
//  project 1
//
//  Created by Ryan Tabler on 3/8/18.
//  Copyright © 2018 Ryan Tabler. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ChapterCell"

class ChapterCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let numChapters: Int = 81 // "Tao Te Ching" always has 81 chapters
    let cellsPerVerticalRow: Int = 4
    let cellsPerHorizontalRow: Int = 7
    let cellMargin: CGFloat = 8.0
    var cellWidthHeight: CGFloat = 0.0 // calculate this in viewDidLoad()
    
    // gives the cells correct widths and matching heights
    func recalculateCellFrames(newViewSize: CGSize?) {
        var cvWidth: CGFloat
        var cvHeight: CGFloat
        if newViewSize == nil {
            // called for the first time by viewDidLoad(),
            // telling this function to figure out the height
            cvWidth = collectionView!.frame.width
            cvHeight = collectionView!.frame.height
        } else {
            // called right before an orientation change,
            // telling this function the future view dimensions
            cvWidth = newViewSize!.width
            cvHeight = newViewSize!.height
        }
        var cellsPerRow = 1
        if cvWidth > cvHeight {
            cellsPerRow = cellsPerHorizontalRow
        } else if cvWidth < cvHeight {
            cellsPerRow = cellsPerVerticalRow
        }
        cellWidthHeight = (cvWidth - (cellMargin * CGFloat(cellsPerRow+1))) / CGFloat(cellsPerRow)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(ChapterCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        recalculateCellFrames(newViewSize: nil)
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        print(cellWidthHeight)
        print("will transition")
        recalculateCellFrames(newViewSize: size)
        print(cellWidthHeight)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare() called")
        if segue.identifier == "openChapter" {
            let indexPath = collectionView?.indexPath(for: sender as! ChapterCell)
            let detailVC = segue.destination
            print(type(of:detailVC))
//            detailVC.chapterNumberLabel.text = "TEST"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return numChapters
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ChapterCell
    
        let thisCellFrame = cell.frame
        cell.frame = CGRect(x: thisCellFrame.minX, y: thisCellFrame.minY, width: cellWidthHeight, height: cellWidthHeight)
        cell.setLabel(text: String(indexPath.row + 1))
        cell.setLabelFrame(width: Float(cellWidthHeight), height: Float(cellWidthHeight))
        
        // Configure the cell
        
//        var cellLabel: UILabel!
//        cellLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        cellLabel.text = String(indexPath.row+1)
//        cellLabel.textAlignment = NSTextAlignment.center
//        cell.addSubview(cellLabel)
        
//        cellLabel.
//        cell.centerXAnchor.constraint(equalTo: cellLabel.centerXAnchor).isActive = true
        
//        let centerXConstraint = NSLayoutConstraint(item: cellLabel, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: cell, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
//        let stupidHeightConstraint = NSLayoutConstraint(item: cellLabel, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.height, multiplier: 1, constant: 400)
//        cell.addConstraints([centerXConstraint, stupidHeightConstraint])

        
        return cell
    }

    // MARK: UICollectionViewDelegate

    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: cellMargin, left: cellMargin, bottom: cellMargin, right: cellMargin)
    }
    // spacing between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(cellMargin)
    }
    // spacing between rows of cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(cellMargin)
    }
    // size of cells that the collectionview expects
    // (should match whatever frame size is set for the ChapterCell)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidthHeight, height: cellWidthHeight)
    }
}
