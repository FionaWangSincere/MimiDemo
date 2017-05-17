//
//  collectionCellCollectionViewCell.swift
//  MimiDemo
//
//  Created by babykang on 2017/5/14.
//  Copyright © 2017年 kangkang. All rights reserved.
//

import UIKit

class collectionCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var star: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.star.backgroundColor = UIColor.white
//        self.star.titleLabel?.text = "STAR"
//        self.star.titleLabel?.textColor = UIColor.purple
        self.star.layer.borderWidth = 2
        self.star.layer.borderColor = UIColor.purple.cgColor
        self.star.layer.cornerRadius = self.star.layer.borderWidth/2
    }

    @IBOutlet weak var imageView: UIImageView!

//    @IBAction func starButton(_ sender: UIButton) {
//        self.star.backgroundColor = UIColor.purple
////        self.star.titleLabel?.text = "❤︎"
////        self.star.titleLabel?.textColor = UIColor.white
//        self.star.layer.cornerRadius = self.star.layer.borderWidth/2
//    }



}


