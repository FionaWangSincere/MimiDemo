//
//  collectionCellCollectionViewCell.swift
//  MimiDemo
//
//  Created by babykang on 2017/5/14.
//  Copyright © 2017年 kangkang. All rights reserved.
//

import UIKit

class collectionCellCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.backgroundColor = UIColor.red
    }

    @IBOutlet weak var imageView: UIImageView!
}
