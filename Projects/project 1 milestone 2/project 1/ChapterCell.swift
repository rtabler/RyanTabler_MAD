//
//  ChapterCell.swift
//  project 1
//
//  Created by Ryan Tabler on 3/8/18.
//  Copyright © 2018 Ryan Tabler. All rights reserved.
//

import UIKit

class ChapterCell: UICollectionViewCell {
    
    
    
    var textLabel : UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
//        textLabel.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        textLabel!.textAlignment = .center
        textLabel!.text = "filler"
        contentView.addSubview(textLabel!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLabel(text: String) {
//        if self.textLabel == nil {
//            let textFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
//            self.textLabel = UILabel(frame: textFrame)
//            textLabel!.font = UIFont(name:"Helvetica-Light", size: 14.0)
            textLabel!.textAlignment = .center
//            textLabel!.textColor = UIColor.whiteColor
//        }
        textLabel!.text = text
    }
    func setLabelFrame(width: Float, height: Float) {
        let textLabelFrame = textLabel!.frame
        textLabel!.frame = CGRect(x: textLabelFrame.minX, y: textLabelFrame.minY, width: CGFloat(width), height: CGFloat(height))
    }
}
